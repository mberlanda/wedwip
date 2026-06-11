import { defineConfig } from 'vite';

// The 2016 archive reproduction lives in public/archive/ and is copied
// verbatim — only the anniversary landing page goes through the bundler.
export default defineConfig({
  // Relative base so the build works both on a custom domain and on
  // GitHub Pages project paths (/wedwip/).
  base: './',
});
