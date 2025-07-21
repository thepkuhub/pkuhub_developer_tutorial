<script setup lang="ts">
defineProps<{
  title: string
  subtitle?: string
  description?: string
  backgroundImage?: string
  gradient?: 'blue' | 'purple' | 'green' | 'orange'
}>()
</script>

<template>
  <div 
    class="apple-hero"
    :class="gradient && `apple-gradient-${gradient}`"
    :style="backgroundImage && { backgroundImage: `url(${backgroundImage})` }"
  >
    <div class="apple-hero-content">
      <h1 class="apple-hero-title">{{ title }}</h1>
      <p v-if="subtitle" class="apple-hero-subtitle">{{ subtitle }}</p>
      <p v-if="description" class="apple-hero-description">{{ description }}</p>
      <div class="apple-hero-actions">
        <slot name="actions" />
      </div>
    </div>
    <div v-if="backgroundImage" class="apple-hero-overlay"></div>
  </div>
</template>

<style scoped>
.apple-hero {
  position: relative;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  overflow: hidden;
}

.apple-hero-content {
  position: relative;
  z-index: 2;
  max-width: 800px;
  padding: 0 var(--apple-spacing-lg);
}

.apple-hero-title {
  font-size: clamp(42px, 8vw, 80px);
  font-weight: 700;
  line-height: 1.1;
  margin-bottom: var(--apple-spacing-lg);
  color: white;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

.apple-hero-subtitle {
  font-size: clamp(20px, 4vw, 32px);
  font-weight: 500;
  margin-bottom: var(--apple-spacing-md);
  color: rgba(255, 255, 255, 0.9);
}

.apple-hero-description {
  font-size: clamp(16px, 2vw, 20px);
  font-weight: 400;
  line-height: 1.5;
  margin-bottom: var(--apple-spacing-xl);
  color: rgba(255, 255, 255, 0.8);
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.apple-hero-actions {
  display: flex;
  gap: var(--apple-spacing-md);
  justify-content: center;
  flex-wrap: wrap;
}

.apple-hero-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.4);
  z-index: 1;
}
</style>
