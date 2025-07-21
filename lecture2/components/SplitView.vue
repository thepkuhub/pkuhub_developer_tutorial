<template>
  <div class="split-view">
    <div class="split-left">
      <slot name="left" />
    </div>
    <div class="split-right">
      <slot name="right" />
    </div>
  </div>
</template>

<style scoped>
.split-view {
  @apply flex w-full h-full;
}

.split-left, .split-right {
  @apply w-1/2 p-4 overflow-auto;
}
</style>
