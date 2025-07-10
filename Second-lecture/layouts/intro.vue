<template>
  <div class="slidev-layout intro-layout" :style="backgroundStyle">
    <div class="intro-overlay" v-if="hasBackground"></div>
    <div class="intro-content">
      <div class="intro-main">
        <slot />
      </div>
      <div class="intro-sidebar">
        <slot name="sidebar" />
      </div>
    </div>
    <div class="intro-background" v-if="!hasBackground"></div>
  </div>
</template>

<script setup>
import { computed, inject } from "vue";

const props = defineProps({
  background: String,
  backgroundImage: String,
});

const slidev = inject("slidev", {});

const frontmatter = slidev?.nav?.currentSlide?.frontmatter || {};

const backgroundUrl = computed(() => {
  return (
    props.background ||
    props.backgroundImage ||
    frontmatter.background ||
    frontmatter.backgroundImage
  );
});

const hasBackground = computed(() => !!backgroundUrl.value);

const backgroundStyle = computed(() => {
  if (backgroundUrl.value) {
    return {
      backgroundImage: `url(${backgroundUrl.value})`,
      backgroundSize: "cover",
      backgroundPosition: "center",
      backgroundRepeat: "no-repeat",
    };
  }
  return {};
});
</script>

<style scoped>
.intro-layout {
  @apply h-full relative overflow-hidden;
}

.intro-overlay {
  @apply absolute inset-0 bg-black bg-opacity-30 z-0;
}

.intro-content {
  @apply h-full flex items-center z-10 relative px-16 py-12;
}

.intro-main {
  @apply flex-1 pr-8;
}

.intro-sidebar {
  @apply w-80 flex flex-col justify-center;
}

.intro-layout :deep(h1) {
  @apply text-5xl font-bold mb-6;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

/* 当有背景图片时，标题使用白色 */
.intro-layout:has(.intro-overlay) :deep(h1) {
  @apply text-white;
  background: none;
  -webkit-text-fill-color: white;
}

.intro-layout :deep(p) {
  @apply text-lg text-gray-600 dark:text-gray-300 leading-relaxed mb-6;
}

/* 当有背景图片时，段落使用白色 */
.intro-layout:has(.intro-overlay) :deep(p) {
  @apply text-white text-opacity-90;
}

.intro-background {
  @apply absolute inset-0 z-0;
  background:
    radial-gradient(
      circle at 20% 80%,
      rgba(0, 113, 227, 0.1) 0%,
      transparent 50%
    ),
    radial-gradient(
      circle at 80% 20%,
      rgba(52, 170, 220, 0.1) 0%,
      transparent 50%
    );
}
</style>
