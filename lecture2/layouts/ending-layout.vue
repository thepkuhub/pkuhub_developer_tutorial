<template>
  <div class="slidev-layout ending-layout">
    <div class="ending-content">
      <slot />
    </div>
    <div class="ending-footer">
      <slot name="footer" />
    </div>
    <div class="ending-background"></div>
  </div>
</template>

<style scoped>
.ending-layout {
  @apply h-full flex flex-col justify-center items-center text-center relative overflow-hidden;
}

.ending-content {
  @apply z-10 px-14 py-10 flex-grow flex flex-col justify-center items-center;
}

.ending-footer {
  @apply z-10 w-full p-4 flex justify-center items-center;
}

.ending-background {
  @apply absolute inset-0 z-0;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  opacity: 0.1;
}

.ending-layout h1 {
  @apply text-5xl font-bold mb-6;
  background: linear-gradient(to right, #0071e3, #34aadc);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.ending-layout p {
  @apply text-xl opacity-80 max-w-2xl mx-auto;
}
</style>
