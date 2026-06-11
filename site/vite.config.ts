import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import { defineConfig } from 'vite';

// Multi-page build: the anniversary landing page plus the static
// reproduction of the original 2016 site (added in a later PR).
const pages = ['index.html', 'archive/index.html', 'archive/en/index.html'];

export default defineConfig({
  // Relative base so the build works both on a custom domain and on
  // GitHub Pages project paths (/wedwip/).
  base: './',
  build: {
    rollupOptions: {
      input: Object.fromEntries(
        pages
          .filter((page) => existsSync(resolve(import.meta.dirname, page)))
          .map((page) => [
            page.replace(/\/?index\.html$/, '') || 'main',
            resolve(import.meta.dirname, page),
          ]),
      ),
    },
  },
});
