<template>
  <div class="slidev-layout explanation-layout">
    <div class="explanation-header">
      <slot name="header">
        <h1><slot name="title">解释</slot></h1>
      </slot>
    </div>
    <div class="explanation-content">
      <div class="explanation-main">
        <slot />
      </div>
      <div class="explanation-side">
        <slot name="side" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.explanation-layout {
  @apply h-full px-14 py-10;
}

.explanation-header {
  @apply mb-8;
}

.explanation-layout h1 {
  @apply text-4xl font-bold;
  background: linear-gradient(to right, #0071e3, #34aadc);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.explanation-content {
  @apply grid grid-cols-[2fr_1fr] gap-10 h-[calc(100%-6rem)];
}

.explanation-main {
  @apply overflow-auto pr-4;
}

.explanation-side {
  @apply bg-gray-50 dark:bg-gray-800/50 rounded-lg p-6 overflow-auto;
}
</style>
