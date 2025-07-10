<script setup lang="ts">
defineProps({
  title: {
    type: String,
    default: ''
  },
  subtitle: {
    type: String,
    default: ''
  },
  type: {
    type: String,
    default: 'default', // default, info, warning, success, error
    validator: (value: string) => ['default', 'info', 'warning', 'success', 'error'].includes(value)
  },
  scale: {
    type: Boolean,
    default: true
  }
})
</script>

<template>
  <div 
    class="content-container" 
    :class="[
      `content-container-${type}`,
      { 'content-container-scale': scale }
    ]"
  >
    <div v-if="title" class="content-header">
      <h3 class="content-title">{{ title }}</h3>
      <p v-if="subtitle" class="content-subtitle">{{ subtitle }}</p>
    </div>
    <div class="content-body">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.content-container {
  @apply rounded-lg p-4 mb-4 border;
  max-height: 100%;
  overflow: auto;
}

.content-container-scale {
  transform-origin: top left;
  transition: transform 0.3s ease;
}

.content-container-default {
  @apply bg-white dark:bg-gray-800 border-gray-200 dark:border-gray-700;
}

.content-container-info {
  @apply bg-blue-50 dark:bg-blue-900/30 border-blue-200 dark:border-blue-800;
}

.content-container-warning {
  @apply bg-yellow-50 dark:bg-yellow-900/30 border-yellow-200 dark:border-yellow-800;
}

.content-container-success {
  @apply bg-green-50 dark:bg-green-900/30 border-green-200 dark:border-green-800;
}

.content-container-error {
  @apply bg-red-50 dark:bg-red-900/30 border-red-200 dark:border-red-800;
}

.content-header {
  @apply mb-2 pb-2 border-b border-gray-200 dark:border-gray-700;
}

.content-title {
  @apply text-lg font-medium;
}

.content-subtitle {
  @apply text-sm text-gray-500 dark:text-gray-400;
}

.content-body {
  @apply text-sm;
}
</style>
