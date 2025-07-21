<template>
  <div class="slidev-layout cover-layout">
    <div class="cover-content">
      <slot />
    </div>
    <div class="cover-background"></div>
  </div>
</template>

<style scoped>
.cover-layout {
  @apply h-full flex flex-col justify-center items-center text-center relative overflow-hidden;
}

.cover-content {
  @apply z-10 px-14 py-10;
}

.cover-background {
  @apply absolute inset-0 z-0;
  background: linear-gradient(135deg, #0071e3 0%, #34aadc 100%);
  opacity: 0.1;
}

.cover-layout h1 {
  @apply text-5xl font-bold mb-6;
  background: linear-gradient(to right, #0071e3, #34aadc);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.cover-layout p {
  @apply text-xl opacity-80 max-w-2xl mx-auto;
}
</style>
