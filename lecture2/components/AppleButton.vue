<script setup lang="ts">
defineProps<{
  variant?: 'primary' | 'secondary' | 'tertiary'
  size?: 'small' | 'medium' | 'large'
  color?: 'blue' | 'purple' | 'green' | 'orange' | 'red'
  disabled?: boolean
  loading?: boolean
}>()

defineEmits<{
  click: [event: MouseEvent]
}>()
</script>

<template>
  <button 
    class="apple-button"
    :class="[
      `apple-button-${variant || 'primary'}`,
      `apple-button-${size || 'medium'}`,
      color && `apple-button-${color}`,
      { 'apple-button-disabled': disabled || loading }
    ]"
    :disabled="disabled || loading"
    @click="$emit('click', $event)"
  >
    <div v-if="loading" class="apple-button-spinner"></div>
    <slot />
  </button>
</template>

<style scoped>
.apple-button-small {
  padding: 8px 16px;
  font-size: 15px;
  border-radius: var(--apple-radius-medium);
}

.apple-button-medium {
  padding: 12px 24px;
  font-size: 17px;
  border-radius: var(--apple-radius-large);
}

.apple-button-large {
  padding: 16px 32px;
  font-size: 20px;
  border-radius: var(--apple-radius-xlarge);
}

.apple-button-tertiary {
  background: transparent;
  color: var(--apple-blue);
  border: none;
  box-shadow: none;
}

.apple-button-tertiary:hover {
  background: var(--apple-fill);
  transform: none;
}

.apple-button-purple {
  background: var(--apple-system-purple);
}

.apple-button-purple:hover {
  background: #9147CA;
}

.apple-button-green {
  background: var(--apple-system-green);
}

.apple-button-green:hover {
  background: #28A745;
}

.apple-button-orange {
  background: var(--apple-system-orange);
}

.apple-button-orange:hover {
  background: #E8890B;
}

.apple-button-red {
  background: var(--apple-system-red);
}

.apple-button-red:hover {
  background: #DC3545;
}

.apple-button-disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none !important;
}

.apple-button-spinner {
  width: 16px;
  height: 16px;
  border: 2px solid transparent;
  border-top: 2px solid currentColor;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-right: 8px;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
</style>
