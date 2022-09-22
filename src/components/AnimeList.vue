<template>
  <div class="anime-list" v-if="my_anime.length > 0">
    <h2>MY ANIME LIST:</h2>
    <div v-for="anime in my_anime">
      <div :class="handleCompletedAnime(anime)">
        <img :src="anime.image" />
        <h4>{{ anime.title }}</h4>
        <span class="flex-1"></span>
        <span class="episodes">
          {{ anime.watched_episodes }} / {{ anime.total_episodes }}
        </span>
        <button
          class="button"
          @click="$emit('decrease-watched-episode', anime)"
        >
          -
        </button>
        <button
          class="button"
          @click="$emit('increase-watched-episode', anime)"
        >
          +
        </button>
        <button class="button" @click="$emit('remove-anime', anime.id)">
          x
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AnimeList",
  props: {
    my_anime: Array,
  },
  emits: [
    "decrease-watched-episode",
    "increase-watched-episode",
    "remove-anime",
  ],
  methods: {
    handleCompletedAnime(anime) {
      if (anime.watched_episodes === anime.total_episodes) {
        return "anime completed";
      } else {
        return "anime";
      }
    },
  },
};
</script>

<style scoped>
.anime-list h2 {
  color: #888888;
  font-weight: 200;
  margin: 0.8rem 0rem;
}

.anime {
  align-items: center;
  background-color: white;
  border-radius: 0.4rem;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-bottom: 1.4rem;
  padding: 0.8rem;
}

.anime img {
  border-radius: 0.4rem;
  height: 4rem;
  margin-right: 1.2rem;
  object-fit: cover;
  width: 4rem;
}

.anime h4 {
  color: #888888;
  font-size: 1.2rem;
}

.anime .episodes {
  color: #888888;
  padding: 0rem 1.2rem;
}

.anime .button {
  background-color: #eeeeee;
  border-radius: 0.4rem;
  color: #888888;
  margin: 0rem 0.2rem;
  padding: 0.4rem 0.8rem;
}

.anime .button:hover {
  background-color: skyblue;
  color: white;
}

.anime.completed {
  background-color: #444444;
}

.anime.completed h4 {
  text-decoration: line-through;
}

.flex-1 {
  display: block;
  flex: 1 1 0%;
}
</style>
