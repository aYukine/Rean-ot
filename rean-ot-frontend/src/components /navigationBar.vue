<script setup lang="ts">
const navigationItems = ['Courses', 'Teachers', 'Requests', 'Messages', 'Teach']
const brandText = 'រៀនអត់?'
</script>

<template>
	<header class="navbar">
		<div class="navbar__brand">
			<div class="navbar__logo-mark">
				<img class="navbar__logo" src="/logo.png" alt="Logo" />
			</div>
			<span class="navbar__brand-text">{{ brandText }}</span>
		</div>

		<nav class="navbar__links" aria-label="Primary">
			<a v-for="item in navigationItems" :key="item" href="#">{{ item }}</a>
		</nav>

		<div class="navbar__actions">
			<button type="button" class="icon-button" aria-label="Cart">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<path
						d="M2 3h2l2.2 10.3A2 2 0 0 0 8.2 15h8.9a2 2 0 0 0 1.98-1.65L20.5 7H6.1"
						fill="none"
						stroke="currentColor"
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="1.8"
					/>
					<circle cx="9" cy="20" r="1.3" fill="currentColor" />
					<circle cx="17" cy="20" r="1.3" fill="currentColor" />
				</svg>
				<span class="badge">2</span>
			</button>

			<button type="button" class="icon-button" aria-label="Notifications">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<path
						d="M12 5a5 5 0 0 0-5 5v2.3c0 .7-.2 1.4-.6 2l-1 1.5a1 1 0 0 0 .8 1.6h12.4a1 1 0 0 0 .8-1.6l-1-1.5c-.4-.6-.6-1.3-.6-2V10a5 5 0 0 0-5-5Z"
						fill="none"
						stroke="currentColor"
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="1.8"
					/>
					<path
						d="M10 19a2 2 0 0 0 4 0"
						fill="none"
						stroke="currentColor"
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="1.8"
					/>
				</svg>
				<span class="badge badge--alert">2</span>
			</button>

			<button type="button" class="avatar" aria-label="User profile">CD</button>
		</div>
	</header>
</template>

<style scoped>
.navbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 1.25rem;
	height: 62px;
	padding: 0 1rem 0 0.85rem;
	background: #ffffff;
	border-bottom: 1px solid #eceff3;
	box-sizing: border-box;
}

.navbar__brand {
	display: flex;
	align-items: center;
	gap: 0.55rem;
	flex: 0 0 auto;
}

.navbar__logo-mark {
	display: flex;
	align-items: center;
	justify-content: center;
	width: clamp(50px, 5vw, 62px);
	height: clamp(50px, 5vw, 62px);
	padding: clamp(8px, 0.85vw, 11px);
	margin-top: 1px;
	margin-left: 1px;
	background: #2f6df6;
	border-radius: 16px;
	box-shadow: 0 1px 0 rgba(15, 23, 42, 0.04), inset 0 -1px 0 rgba(255, 255, 255, 0.12);
	flex: 0 0 auto;
	box-sizing: border-box;
}

.navbar__logo {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.navbar__brand-text {
	color: #1f2937;
	font-family: 'Noto Sans Khmer', 'Kantumruy Pro', 'Kantumruy', sans-serif;
	font-size: clamp(1.05rem, 1.45vw, 1.28rem);
	font-weight: 700;
	line-height: 1;
	letter-spacing: 0;
	white-space: nowrap;
}

.navbar__links {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 2.25rem;
	flex: 1 1 auto;
	min-width: 0;
}

.navbar__links a {
	color: #5f6676;
	font-size: 0.82rem;
	font-weight: 500;
	text-decoration: none;
	white-space: nowrap;
}

.navbar__links a:hover {
	color: #111827;
}

.navbar__actions {
	display: flex;
	align-items: center;
	gap: 0.7rem;
	flex: 0 0 auto;
}

.icon-button {
	position: relative;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 28px;
	height: 28px;
	padding: 0;
	color: #475569;
	background: transparent;
	border: 0;
	border-radius: 999px;
	cursor: pointer;
}

.icon-button svg {
	width: 19px;
	height: 19px;
}

.badge {
	position: absolute;
	top: -3px;
	right: -3px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	min-width: 15px;
	height: 15px;
	padding: 0 3px;
	color: #ffffff;
	font-size: 0.6rem;
	font-weight: 700;
	line-height: 1;
	background: #4f67ff;
	border: 2px solid #ffffff;
	border-radius: 999px;
	box-sizing: border-box;
}

.badge--alert {
	background: #ef4444;
}

.avatar {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 28px;
	height: 28px;
	padding: 0;
	color: #ffffff;
	font-size: 0.62rem;
	font-weight: 700;
	letter-spacing: 0.02em;
	background: #2563eb;
	border: 0;
	border-radius: 999px;
	cursor: pointer;
}

@media (max-width: 900px) {
	.navbar {
		gap: 1rem;
	}

	.navbar__logo-mark {
		width: 56px;
		height: 56px;
		padding: 9px;
	}

	.navbar__links {
		gap: 1.25rem;
	}
}

@media (max-width: 720px) {
	.navbar {
		padding: 0 0.7rem 0 0.55rem;
	}

	.navbar__links {
		display: none;
	}

	.navbar__logo-mark {
		width: 48px;
		height: 48px;
		padding: 8px;
		border-radius: 16px;
	}

	.navbar__brand-text {
		font-size: 1rem;
	}
}
</style>
