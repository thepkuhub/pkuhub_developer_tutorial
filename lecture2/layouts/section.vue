<!--
 * @Author: Ethan && ethan@hanlife02.com
 * @Date: 2025-05-31 00:04:59
 * @LastEditors: Ethan && ethan@hanlife02.com
 * @LastEditTime: 2025-05-31 00:22:53
 * @FilePath: /slidev-customized-ethan/layouts/section.vue
 * @Description: 
 * 
 * Copyright (c) 2025 by Ethan, All Rights Reserved. 
-->
<template>
  <div class="slidev-layout section-layout" :style="backgroundStyle">
    <div class="section-overlay" v-if="hasBackground"></div>
    <div class="section-content">
      <div
        class="section-number"
        v-if="slidev.nav.currentSlide?.frontmatter?.section"
      >
        {{ slidev.nav.currentSlide.frontmatter.section }}
      </div>
      <slot />
    </div>
    <div class="section-background" v-if="!hasBackground"></div>
  </div>
</template>

<script setup>
import { computed, inject } from "vue";

const props = defineProps({
  background: String,
  backgroundImage: String,
});

const slidev = inject("slidev");

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
  return {
    background: "linear-gradient(135deg, #0071e3 0%, #34aadc 100%)",
  };
});
</script>

<style scoped>
.section-layout {
  @apply h-full flex flex-col justify-center items-center text-center relative overflow-hidden;
}

.section-overlay {
  @apply absolute inset-0 bg-black bg-opacity-50 z-0;
}

.section-content {
  @apply z-10 px-16 py-12 text-white;
}

.section-number {
  @apply text-6xl font-bold opacity-30 mb-4;
}

.section-layout :deep(h1) {
  @apply text-5xl font-bold mb-6 text-white;
}

.section-layout :deep(p) {
  @apply text-xl opacity-90 leading-relaxed;
}

.section-background {
  @apply absolute inset-0 z-0;
  background:
    radial-gradient(
      circle at 20% 80%,
      rgba(255, 255, 255, 0.1) 0%,
      transparent 50%
    ),
    radial-gradient(
      circle at 80% 20%,
      rgba(255, 255, 255, 0.1) 0%,
      transparent 50%
    );
}
</style>
