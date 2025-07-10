<!--
 * @Author: Ethan && ethan@hanlife02.com
 * @Date: 2025-05-31 00:04:53
 * @LastEditors: Ethan && ethan@hanlife02.com
 * @LastEditTime: 2025-05-31 00:31:26
 * @FilePath: /slidev-customized-ethan/layouts/center.vue
 * @Description: 
 * 
 * Copyright (c) 2025 by Ethan, All Rights Reserved. 
-->
<template>
  <div class="slidev-layout center-layout">
    <div class="center-content">
      <slot />
    </div>
    <div class="center-decoration">
      <div class="decoration-dot decoration-dot-1"></div>
      <div class="decoration-dot decoration-dot-2"></div>
      <div class="decoration-dot decoration-dot-3"></div>
      <div class="decoration-dot decoration-dot-4"></div>
    </div>
  </div>
</template>

<style scoped>
.center-layout {
  @apply h-full flex flex-col justify-center items-center text-center relative overflow-hidden px-16 py-12;
}

.center-content {
  @apply z-10 max-w-4xl;
}

.center-layout :deep(h1) {
  @apply text-5xl font-bold mb-8 leading-tight;
  background: linear-gradient(135deg,rgb(248, 248, 249) 0%, #34aadc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.center-layout :deep(p) {
  @apply text-xl text-gray-600 dark:text-gray-300 leading-relaxed mb-6;
}

.center-decoration {
  @apply absolute inset-0 z-0;
}

.decoration-dot {
  @apply absolute w-2 h-2 bg-blue-400 rounded-full opacity-30;
}

.decoration-dot-1 {
  @apply top-1/4 left-1/4;
  animation: float 6s ease-in-out infinite;
}

.decoration-dot-2 {
  @apply top-1/3 right-1/4;
  animation: float 6s ease-in-out infinite 1s;
}

.decoration-dot-3 {
  @apply bottom-1/4 left-1/3;
  animation: float 6s ease-in-out infinite 2s;
}

.decoration-dot-4 {
  @apply bottom-1/3 right-1/3;
  animation: float 6s ease-in-out infinite 3s;
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}
</style>
