<template>
  <div class="slidev-layout cover-layout" :style="backgroundStyle">
    <div class="cover-overlay" v-if="hasBackground"></div>
    <div class="cover-content">
      <slot />
    </div>
    <div class="cover-decoration" v-if="!hasBackground">
      <div class="decoration-circle decoration-circle-1"></div>
      <div class="decoration-circle decoration-circle-2"></div>
      <div class="decoration-circle decoration-circle-3"></div>
    </div>
  </div>
</template>

<script setup>
import { computed, inject } from 'vue'

const props = defineProps({
  background: String,
  backgroundImage: String,
})

const slidev = inject('slidev', {})
const frontmatter = slidev?.nav?.currentSlide?.frontmatter || {}

const backgroundUrl = computed(() => {
  return props.background || 
         props.backgroundImage || 
         frontmatter.background || 
         frontmatter.backgroundImage
})

const hasBackground = computed(() => !!backgroundUrl.value)

const backgroundStyle = computed(() => {
  if (backgroundUrl.value) {
    return {
      backgroundImage: `url(${backgroundUrl.value})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat'
    }
  }
  return {
    background: 'linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%)'
  }
})
</script>

<style scoped>
.cover-layout {
  @apply h-full flex flex-col justify-center items-center text-center relative overflow-hidden;
}

.cover-overlay {
  @apply absolute inset-0 bg-black bg-opacity-40 z-0;
}

.cover-content {
  @apply z-10 px-16 py-12 max-w-4xl;
}

.cover-layout :deep(h1) {
  @apply text-6xl font-bold mb-6 leading-tight;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

/* 当有背景图片时，标题使用白色 */
.cover-layout:has(.cover-overlay) :deep(h1) {
  @apply text-white;
  background: none;
  -webkit-text-fill-color: white;
}

.cover-layout :deep(p) {
  @apply text-xl text-gray-600 dark:text-gray-300 mb-8 leading-relaxed;
}

/* 当有背景图片时，段落使用白色 */
.cover-layout:has(.cover-overlay) :deep(p) {
  @apply text-white text-opacity-90;
}

.cover-decoration {
  @apply absolute inset-0 z-0;
}

.decoration-circle {
  @apply absolute rounded-full opacity-10;
}

.decoration-circle-1 {
  @apply w-96 h-96 bg-blue-500 -top-48 -right-48;
}

.decoration-circle-2 {
  @apply w-64 h-64 bg-purple-500 -bottom-32 -left-32;
}

.decoration-circle-3 {
  @apply w-32 h-32 bg-cyan-500 top-1/4 left-1/4;
}

html.dark .cover-layout {
  background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
}

/* 暗色模式下有背景图片时保持原样 */
html.dark .cover-layout:has(.cover-overlay) {
  background: none;
}
</style>
