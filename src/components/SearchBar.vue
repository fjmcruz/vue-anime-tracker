<template>
  <form @submit.prevent="$emit('search')">
    <input
      type="text"
      :placeholder="placeholder"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
    />
    <button class="button" type="submit">Search</button>
  </form>
</template>

<script>
export default {
  name: "SearchBar",
  props: { placeholder: String, modelValue: String },
  emits: ["search", "update:modelValue"],
};
</script>

<style scoped>
form {
  display: flex;
  margin: 1.2rem 0rem;
  width: 100%;
}

form input {
  background: white;
  border-radius: 0.4rem 0rem 0rem 0.4rem;
  border: none;
  color: #888888;
  display: block;
  font-size: 1.2rem;
  outline: none;
  padding: 0.4rem 1.2rem;
  width: 100%;
}

.button {
  border-radius: 0rem 0.4rem 0.4rem 0rem;
}
</style>
