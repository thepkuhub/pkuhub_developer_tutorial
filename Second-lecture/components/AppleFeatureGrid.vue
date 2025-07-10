<script setup lang="ts">
defineProps<{
  features: Array<{
    icon: string
    title: string
    description: string
    color?: string
  }>
  columns?: 2 | 3 | 4
}>()
</script>

<template>
  <div 
    class="apple-feature-grid"
    :class="`apple-feature-grid-${columns || 3}`"
  >
    <div 
      v-for="(feature, index) in features" 
      :key="index"
      class="apple-feature-item"
      v-click
    >
      <div 
        class="apple-feature-icon"
        :style="feature.color && { color: feature.color }"
      >
        {{ feature.icon }}
      </div>
      <h3 class="apple-feature-title">{{ feature.title }}</h3>
      <p class="apple-feature-description">{{ feature.description }}</p>
    </div>
  </div>
</template>

<style scoped>
.apple-feature-grid {
  display: grid;
  gap: var(--apple-spacing-xl);
  margin: var(--apple-spacing-2xl) 0;
}

.apple-feature-grid-2 {
  grid-template-columns: repeat(2, 1fr);
}

.apple-feature-grid-3 {
  grid-template-columns: repeat(3, 1fr);
}

.apple-feature-grid-4 {
  grid-template-columns: repeat(4, 1fr);
}

.apple-feature-item {
  text-align: center;
  padding: var(--apple-spacing-lg);
  background: var(--apple-background-tertiary);
  border-radius: var(--apple-radius-large);
  border: 1px solid var(--apple-separator);
  transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.apple-feature-item:hover {
  transform: translateY(-8px);
  box-shadow: var(--apple-shadow-3);
}

.apple-feature-icon {
  font-size: 48px;
  margin-bottom: var(--apple-spacing-md);
  color: var(--apple-blue);
}

.apple-feature-title {
  @apply apple-text-headline;
  color: var(--apple-label);
  margin-bottom: var(--apple-spacing-sm);
}

.apple-feature-description {
  @apply apple-text-body;
  color: var(--apple-label-secondary);
  line-height: 1.5;
}

@media (max-width: 768px) {
  .apple-feature-grid-3,
  .apple-feature-grid-4 {
    grid-template-columns: 1fr;
  }
  
  .apple-feature-grid-2 {
    grid-template-columns: 1fr;
  }
}
</style>
