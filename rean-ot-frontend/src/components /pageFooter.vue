<script setup lang="ts">
import { useRouter } from 'vue-router'

const router = useRouter()

const exploreLinks = ['All Courses', 'Programming', 'Design', 'Business', 'Languages']
const studentLinks = ['Browse Courses', 'Find Teachers', 'Post a Request', 'My Dashboard', 'Help Center']
const teacherLinks = [
  'Teach on រៀនអត់?',
  'Teacher Dashboard',
  'Browse Requests',
  'Resources',
  'Success Stories',
]

const goHome = () => {
  router.push('/')
}
</script>

<template>
  <footer class="footer">
    <div class="footer__content">
      <section class="footer__brand-column">
        <button class="brand" type="button" @click="goHome" aria-label="Go to home">
          <span class="brand__logo-wrap">
            <img class="brand__logo" src="/logo.png" alt="Logo" />
          </span>
          <span class="brand__text">រៀនអត់?</span>
        </button>

        <p class="brand__description">
          Cambodia's premier learning marketplace. Learn anything from expert teachers, or share your
          knowledge with the world.
        </p>

        <div class="socials" aria-label="Social links">
          <button type="button" class="socials__btn" @click="goHome" aria-label="Facebook">
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                d="M13.2 8.5h2V6h-2.3c-2.2 0-3.6 1.4-3.6 3.7v1.8H7v2.4h2.3V20h2.6v-6.1h2.3l.4-2.4h-2.7V9.9c0-.9.4-1.4 1.3-1.4Z"
                fill="currentColor"
              />
            </svg>
          </button>
          <button type="button" class="socials__btn" @click="goHome" aria-label="Twitter">
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                d="M18.8 7.3c.7-.1 1.4-.4 1.9-.8-.3.7-.8 1.2-1.4 1.6.6 3.9-2.2 8.2-7.7 8.2-1.5 0-2.9-.4-4.1-1.2 1.4.2 2.8-.2 3.9-1.1-1.2 0-2.2-.8-2.5-1.9.4.1.8.1 1.1 0-1.3-.3-2.2-1.4-2.2-2.8.4.2.8.3 1.3.4-1.2-.8-1.5-2.4-.8-3.6 1.4 1.7 3.5 2.8 5.9 2.9-.4-1.8 1-3.4 2.9-3.4.9 0 1.7.4 2.3 1 .7-.1 1.3-.4 1.9-.7-.2.7-.7 1.3-1.5 1.4Z"
                fill="currentColor"
              />
            </svg>
          </button>
          <button type="button" class="socials__btn" @click="goHome" aria-label="Instagram">
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                d="M7.5 4h9A3.5 3.5 0 0 1 20 7.5v9a3.5 3.5 0 0 1-3.5 3.5h-9A3.5 3.5 0 0 1 4 16.5v-9A3.5 3.5 0 0 1 7.5 4Zm0 1.9c-.9 0-1.6.7-1.6 1.6v9c0 .9.7 1.6 1.6 1.6h9c.9 0 1.6-.7 1.6-1.6v-9c0-.9-.7-1.6-1.6-1.6h-9Zm10 1.1a1 1 0 1 0 0 2 1 1 0 0 0 0-2ZM12 8a4 4 0 1 1 0 8.1A4 4 0 0 1 12 8Zm0 1.9a2.1 2.1 0 1 0 0 4.2 2.1 2.1 0 0 0 0-4.2Z"
                fill="currentColor"
              />
            </svg>
          </button>
          <button type="button" class="socials__btn" @click="goHome" aria-label="LinkedIn">
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                d="M6.8 8.6A1.4 1.4 0 1 1 6.8 5.8 1.4 1.4 0 0 1 6.8 8.6ZM5.6 10.1H8V18H5.6v-7.9ZM9.8 10.1h2.3v1.1h.1c.3-.6 1.1-1.3 2.3-1.3 2.5 0 3 1.6 3 3.8V18h-2.4v-3.8c0-.9 0-2.1-1.3-2.1s-1.5 1-1.5 2v3.9H9.8v-7.9Z"
                fill="currentColor"
              />
            </svg>
          </button>
        </div>
      </section>

      <section class="footer__links-column">
        <h3>Explore</h3>
        <button
          v-for="item in exploreLinks"
          :key="item"
          type="button"
          class="footer-link"
          @click="goHome"
        >
          {{ item }}
        </button>
      </section>

      <section class="footer__links-column">
        <h3>For Students</h3>
        <button
          v-for="item in studentLinks"
          :key="item"
          type="button"
          class="footer-link"
          @click="goHome"
        >
          {{ item }}
        </button>
      </section>

      <section class="footer__links-column">
        <h3>For Teachers</h3>
        <button
          v-for="item in teacherLinks"
          :key="item"
          type="button"
          class="footer-link"
          @click="goHome"
        >
          {{ item }}
        </button>
      </section>
    </div>

    <div class="footer__bottom">
      <button type="button" class="legal legal--muted" @click="goHome">
        © 2026 រៀនអត់? Learning Marketplace. All rights reserved.
      </button>
      <div class="footer__bottom-links">
        <button type="button" class="legal" @click="goHome">Terms of Service</button>
        <button type="button" class="legal" @click="goHome">Privacy Policy</button>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  padding: 3.9rem 2.9rem 1.2rem;
  color: #d7e1f4;
  background: radial-gradient(circle at 0% 0%, #132543 0%, #0d1e3c 42%, #0b1734 100%);
}

.footer__content {
  display: grid;
  grid-template-columns: 2.2fr 1fr 1fr 1fr;
  gap: 2.4rem;
  padding-bottom: 2.8rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.footer__brand-column {
  max-width: 440px;
}

.brand {
  display: inline-flex;
  align-items: center;
  gap: 0.6rem;
  padding: 0;
  color: inherit;
  background: transparent;
  border: 0;
  cursor: pointer;
}

.brand__logo-wrap {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 36px;
  height: 36px;
  padding: 7px;
  background: #2f6df6;
  border-radius: 9px;
  box-sizing: border-box;
}

.brand__logo {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.brand__text {
  color: #f8fbff;
  font-family: 'Noto Sans Khmer', 'Kantumruy Pro', 'Kantumruy', sans-serif;
  font-size: 2rem;
  font-weight: 800;
  line-height: 1;
}

.brand__description {
  max-width: 440px;
  margin: 1rem 0 1.3rem;
  color: #9fb0cf;
  font-size: 0.92rem;
  line-height: 1.45;
}

.socials {
  display: flex;
  align-items: center;
  gap: 0.78rem;
}

.socials__btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 29px;
  height: 29px;
  padding: 0;
  color: #9fb0cf;
  background: transparent;
  border: 0;
  border-radius: 50%;
  cursor: pointer;
}

.socials__btn svg {
  width: 20px;
  height: 20px;
}

.footer__links-column h3 {
  margin: 0 0 1rem;
  color: #f4f8ff;
  font-size: 1.1rem;
  font-weight: 700;
}

.footer-link {
  display: block;
  margin-bottom: 0.92rem;
  padding: 0;
  color: #dbe6fa;
  font-size: 0.95rem;
  text-align: left;
  background: transparent;
  border: 0;
  cursor: pointer;
}

.footer-link:last-child {
  margin-bottom: 0;
}

.footer__bottom {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  padding-top: 1.65rem;
}

.footer__bottom-links {
  display: flex;
  align-items: center;
  gap: 1.6rem;
}

.legal {
  padding: 0;
  color: #9fb0cf;
  font-size: 0.99rem;
  background: transparent;
  border: 0;
  cursor: pointer;
}

.legal--muted {
  text-align: left;
}

.footer-link:hover,
.legal:hover,
.socials__btn:hover,
.brand:hover {
  color: #ffffff;
}

@media (max-width: 1200px) {
  .footer {
    padding: 3rem 1.75rem 1.2rem;
  }

  .footer__content {
    grid-template-columns: 1.8fr 1fr 1fr;
  }

  .footer__brand-column {
    grid-column: 1 / -1;
    max-width: 100%;
  }
}

@media (max-width: 760px) {
  .footer {
    padding: 2.3rem 1rem 1rem;
  }

  .footer__content {
    grid-template-columns: 1fr;
    gap: 1.65rem;
    padding-bottom: 1.8rem;
  }

  .footer__bottom {
    flex-direction: column;
    align-items: flex-start;
  }

  .footer__bottom-links {
    gap: 1.1rem;
  }

  .brand__text {
    font-size: 1.65rem;
  }

  .brand__description {
    font-size: 0.98rem;
  }
}
</style>
