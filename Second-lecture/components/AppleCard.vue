<script setup lang="ts">
defineProps<{
  title?: string
  description?: string
  image?: string
  variant?: 'default' | 'featured' | 'compact'
  color?: 'blue' | 'purple' | 'green' | 'orange'
}>()
</script>

<template>
  <div 
    class="apple-card"
    :class="{
      'apple-card-featured': variant === 'featured',
      'apple-card-compact': variant === 'compact'
    }"
  >
    <div v-if="image" class="apple-card-image">
      <img :src="image" :alt="title" />
    </div>
    
    <div class="apple-card-content">
      <h3 v-if="title" class="apple-card-title">{{ title }}</h3>
      <p v-if="description" class="apple-card-description">{{ description }}</p>
      <slot />
    </div>
    
    <div v-if="color" 
         class="apple-card-accent" 
         :class="`apple-gradient-${color}`">
    </div>
  </div>
</template>

<style scoped>
.apple-card-featured {
  padding: var(--apple-spacing-xl);
  background: var(--apple-glass);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.apple-card-compact {
  padding: var(--apple-spacing-md);
}

.apple-card-image {
  margin-bottom: var(--apple-spacing-md);
  border-radius: var(--apple-radius-medium);
  overflow: hidden;
}

.apple-card-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 0;
  box-shadow: none;
}

.apple-card-content {
  position: relative;
  z-index: 2;
}

.apple-card-accent {
  position: absolute;
  top: 0;
  left: 0;
  width: 4px;
  height: 100%;
  border-radius: var(--apple-radius-small);
}

.apple-card:hover .apple-card-accent {
  width: 6px;
}
</style>
