<template>
  <div class="slidev-layout image-right-layout">
    <div class="image-right-content">
      <div class="image-right-text">
        <slot />
      </div>
      <div class="image-right-image">
        <img
          v-if="slidev.nav.currentSlide?.frontmatter?.image"
          :src="slidev.nav.currentSlide.frontmatter.image"
          :alt="slidev.nav.currentSlide?.frontmatter?.alt || 'Image'"
          class="slide-image"
        />
        <slot name="image" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { inject } from "vue";

const slidev = inject("slidev", {});
</script>

<style scoped>
.image-right-layout {
  @apply h-full px-16 py-12;
}

.image-right-content {
  @apply h-full flex items-center gap-12;
}

.image-right-text {
  @apply flex-1 pr-4;
}

.image-right-image {
  @apply w-96 flex-shrink-0 flex items-center justify-center;
}

.slide-image {
  @apply w-full h-auto max-h-96 object-cover rounded-2xl shadow-xl;
}

.image-right-layout :deep(h1) {
  @apply text-4xl font-bold mb-6;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.image-right-layout :deep(h2) {
  @apply text-2xl font-semibold mb-4 text-gray-800 dark:text-gray-200;
}

.image-right-layout :deep(p) {
  @apply text-lg text-gray-600 dark:text-gray-300 leading-relaxed mb-4;
}

.image-right-layout :deep(ul) {
  @apply space-y-2;
}

.image-right-layout :deep(li) {
  @apply flex items-center text-gray-600 dark:text-gray-300;
}

.image-right-layout :deep(li)::before {
  content: "✓";
  @apply text-blue-500 font-bold mr-3 text-lg;
}
</style>
