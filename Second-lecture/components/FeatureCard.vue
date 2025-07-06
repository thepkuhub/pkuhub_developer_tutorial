<script setup lang="ts">
defineProps({
  icon: {
    type: String,
    default: ''
  },
  title: {
    type: String,
    required: true
  },
  description: {
    type: String,
    default: ''
  },
  color: {
    type: String,
    default: 'blue'
  }
})
</script>

<template>
  <div class="feature-card" :class="`feature-card-${color}`">
    <div v-if="icon" class="feature-icon">
      <div v-html="icon"></div>
    </div>
    <div class="feature-content">
      <h3 class="feature-title">{{ title }}</h3>
      <p v-if="description" class="feature-description">{{ description }}</p>
      <slot />
    </div>
  </div>
</template>

<style scoped>
.feature-card {
  @apply p-6 rounded-lg shadow-md transition-all duration-300 hover:shadow-lg;
}

.feature-card-blue {
  @apply bg-blue-50 dark:bg-blue-900/30 border border-blue-200 dark:border-blue-800;
}

.feature-card-green {
  @apply bg-green-50 dark:bg-green-900/30 border border-green-200 dark:border-green-800;
}

.feature-card-red {
  @apply bg-red-50 dark:bg-red-900/30 border border-red-200 dark:border-red-800;
}

.feature-card-yellow {
  @apply bg-yellow-50 dark:bg-yellow-900/30 border border-yellow-200 dark:border-yellow-800;
}

.feature-card-purple {
  @apply bg-purple-50 dark:bg-purple-900/30 border border-purple-200 dark:border-purple-800;
}

.feature-icon {
  @apply text-4xl mb-4;
}

.feature-title {
  @apply text-xl font-bold mb-2;
}

.feature-description {
  @apply text-sm opacity-80;
}
</style>
