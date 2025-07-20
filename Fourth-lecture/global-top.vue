<template>
  <Pagination
    v-if="
      $slidev.nav.currentPage !== $slidev.nav.total + 1 &&
      !$slidev.configs.paginationConfig.paginationPagesDisabled?.includes($slidev.nav.currentPage) &&
      ($slidev.configs.paginationConfig.paginationX || $slidev.configs.paginationConfig.paginationY)
    "
    :x="$slidev.configs.paginationConfig.paginationX"
    :y="$slidev.configs.paginationConfig.paginationY"
  />
</template>
