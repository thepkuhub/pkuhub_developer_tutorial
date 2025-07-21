<template>
  <div class="slidev-layout custom-split">
    <div class="split-container">
      <div class="left-side">
        <slot name="left" />
      </div>
      <div class="divider"></div>
      <div class="right-side">
        <slot name="right" />
      </div>
    </div>
    <div class="footer">
      <slot name="footer" />
    </div>
  </div>
</template>

<style scoped>
.custom-split {
  @apply h-full;
}

.split-container {
  @apply flex h-[90%];
}

.left-side {
  @apply w-1/2 p-8 overflow-auto;
}

.divider {
  @apply w-0.5 h-full bg-gray-200 dark:bg-gray-700;
}

.right-side {
  @apply w-1/2 p-8 overflow-auto;
}

.footer {
  @apply h-[10%] p-4 border-t border-gray-200 dark:border-gray-700 flex items-center justify-between;
}
</style>
