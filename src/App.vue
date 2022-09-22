<template>
  <main>
    <h2>ANIME TRACKER</h2>
    <SearchBar
      @search="searchAnime"
      @update:modelValue="handleInput"
      placeholder="Search anime...."
      v-model="query"
    />
    <SearchResults :search_results="search_results" @add-anime="addAnime" />
    <AnimeList
      :my_anime="my_anime"
      @decrease-watched-episode="decreaseWatchedEpisode"
      @increase-watched-episode="increaseWatchedEpisode"
      @remove-anime="removeAnime"
    />
  </main>
</template>

<script>
import SearchResults from "./components/SearchResults.vue";
import AnimeList from "./components/AnimeList.vue";
import SearchBar from "./components/SearchBar.vue";

export default {
  name: "App",
  components: {
    SearchBar,
    AnimeList,
    SearchResults,
  },
  data() {
    return {
      query: "",
      search_results: [],
      my_anime: [],
    };
  },
  methods: {
    searchAnime() {
      if (this.query.length === 0) {
        alert("No search query entered.");
      } else {
        const url = `https://api.jikan.moe/v4/anime?q=${this.query}`;
        fetch(url)
          .then((response) => response.json())
          .then((response) => {
            if (response.data.length === 0) {
              this.query = "";
              alert("No results found.");
            } else {
              this.search_results = response.data;
            }
          });
      }
    },
    handleInput(value) {
      if (!value) {
        this.search_results = [];
      }
    },
    addAnime(anime) {
      if (this.my_anime.find((item) => item.id === anime.mal_id)) {
        alert("Anime entry already exists.");
      } else {
        this.search_results = [];
        this.query = "";

        this.my_anime.push({
          id: anime.mal_id,
          title: anime.title,
          image: anime.images.jpg.image_url,
          total_episodes: anime.episodes,
          watched_episodes: 0,
        });

        localStorage.setItem("my_anime", JSON.stringify(this.my_anime));
      }
    },
    removeAnime(id) {
      if (confirm("Are you sure you want to remove this Anime entry?")) {
        const filteredAnime = this.my_anime.filter((item) => item.id !== id);
        this.my_anime = filteredAnime;
        localStorage.setItem("my_anime", JSON.stringify(filteredAnime));
      }
    },
    increaseWatchedEpisode(anime) {
      if (anime.watched_episodes != anime.total_episodes) {
        anime.watched_episodes++;
        localStorage.setItem("my_anime", JSON.stringify(this.my_anime));
      }
    },
    decreaseWatchedEpisode(anime) {
      if (anime.watched_episodes === 0) {
        removeAnime(anime.id);
      } else {
        anime.watched_episodes--;
        localStorage.setItem("my_anime", JSON.stringify(this.my_anime));
      }
    },
  },
  mounted() {
    this.my_anime = JSON.parse(localStorage.getItem("my_anime")) || [];
  },
};
</script>

<style>
* {
  box-sizing: border-box;
  font-family: Arial;
  margin: 0;
  padding: 0;
}

body {
  background-color: #eeeeee;
}

main {
  margin: 0 auto;
  max-width: 60%;
  padding: 1.2rem;
}

h2 {
  margin: 0.8rem;
  text-align: center;
}

.button {
  background-color: #888888;
  border: none;
  color: #eeeeee;
  cursor: pointer;
  display: block;
  font-size: 1.2rem;
  outline: none;
  padding: 0.4rem 1.2rem;
  transition: 0.4s;
}

.button:hover {
  background-color: skyblue;
}
</style>
