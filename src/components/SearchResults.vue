<template>
  <div class="results-container" v-if="search_results.length > 0">
    <div class="results">
      <div class="result" v-for="anime in search_results">
        <img :src="anime.images.jpg.image_url" />
        <div class="details">
          <h2>{{ anime.title }}</h2>
          <p :title="anime.synopsis" v-if="anime.synopsis">
            {{ anime.synopsis.slice(0, 120) }}....
          </p>
          <span class="flex-1"></span>
          <button class="button" @click="$emit('add-anime', anime)">
            Add To List
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SearchResults",
  props: {
    search_results: Array,
  },
  emits: ["add-anime"],
};
</script>

<style scoped>
.results-container {
  background-color: white;
  border-radius: 0.4rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  margin: 1.2rem 0rem;
  overflow: hidden;
}

.results {
  max-height: 60vh;
  overflow-y: auto;
}

.result {
  background-color: #eeeeee;
  border-radius: 0.4rem;
  display: flex;
  margin: 0.8rem;
  padding: 0.8rem;
  transition: 0.4s;
}

.result img {
  border-radius: 0.4rem;
  margin-right: 0.8rem;
  width: 8rem;
}

.details {
  align-items: flex-start;
  display: flex;
  flex-direction: column;
  flex: 1 1 0%;
}

.details h2 {
  font-size: 1.2rem;
  margin: 0.4rem 0rem;
  text-align: left;
}

.details p {
  font-size: 0.8rem;
  margin-bottom: 0.4rem;
}

.details .button {
  border-radius: 0.4rem;
  margin-left: auto;
  margin-top: auto;
}
</style>
