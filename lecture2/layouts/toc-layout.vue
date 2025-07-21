<template>
  <div class="slidev-layout toc-layout">
    <div class="toc-header">
      <slot name="header">
        <h1>目录</h1>
      </slot>
    </div>
    <div class="toc-content">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.toc-layout {
  @apply h-full px-14 py-10;
}

.toc-header {
  @apply mb-10;
}

.toc-layout h1 {
  @apply text-4xl font-bold;
  background: linear-gradient(to right, #0071e3, #34aadc);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.toc-content {
  @apply grid grid-cols-2 gap-x-10 gap-y-4;
}

.toc-content :deep(h2) {
  @apply text-2xl font-semibold mb-2;
}

.toc-content :deep(ol), .toc-content :deep(ul) {
  @apply space-y-2;
}

.toc-content :deep(li) {
  @apply flex items-center;
}

.toc-content :deep(li)::before {
  content: '';
  @apply w-2 h-2 bg-blue-500 rounded-full mr-2 flex-shrink-0;
}
</style>
