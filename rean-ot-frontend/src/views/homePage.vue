<script setup lang="ts">
import NavigationBar from '../components /navigationBar.vue'
import PageFooter from '../components /pageFooter.vue'
</script>

<template>
	<div class="home-page">
		<NavigationBar />
		<main class="home-page__content" aria-label="Empty placeholder content"></main>
		<PageFooter />
	</div>
</template>

<style scoped>
:global(body) {
	margin: 0;
	background: #e8ebef;
}

.home-page {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.home-page__content {
	flex: 1;
}
</style>
