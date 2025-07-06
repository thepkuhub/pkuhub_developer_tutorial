<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps<{
  count?: number
}>()

const counter = ref(props.count || 0)

function increment() {
  counter.value++
}
</script>

<template>
  <div class="flex flex-col items-center space-y-2">
    <div class="counter">
      {{ counter }}
    </div>
    <button 
      @click="increment"
      class="px-4 py-2 bg-gradient-to-r from-blue-500 to-cyan-500 text-white rounded-full hover:from-blue-600 hover:to-cyan-600 transition duration-300 shadow-md hover:shadow-lg transform hover:-translate-y-0.5"
    >
      点击增加
    </button>
  </div>
</template>
