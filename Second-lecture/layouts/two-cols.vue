<template>
  <div class="slidev-layout two-cols-layout">
    <div class="two-cols-header" v-if="$slots.header">
      <slot name="header" />
    </div>
    <div class="two-cols-content">
      <div class="two-cols-left">
        <slot />
      </div>
      <div class="two-cols-divider"></div>
      <div class="two-cols-right">
        <slot name="right" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.two-cols-layout {
  @apply h-full px-16 py-12;
}

.two-cols-header {
  @apply mb-8;
}

.two-cols-header :deep(h1) {
  @apply text-4xl font-bold mb-4;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.two-cols-content {
  @apply flex h-full gap-8 items-start;
}

.two-cols-left,
.two-cols-right {
  @apply flex-1 overflow-auto;
}

.two-cols-divider {
  @apply w-px bg-gray-200 dark:bg-gray-700 flex-shrink-0;
}

.two-cols-left :deep(h2),
.two-cols-right :deep(h2) {
  @apply text-2xl font-semibold mb-4 text-gray-800 dark:text-gray-200;
}

.two-cols-left :deep(h3),
.two-cols-right :deep(h3) {
  @apply text-xl font-medium mb-3 text-gray-700 dark:text-gray-300;
}
</style>
