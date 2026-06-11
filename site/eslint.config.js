import js from '@eslint/js';
import tseslint from 'typescript-eslint';

export default tseslint.config(
  // public/archive/ is the vendored 2016 theme + reproduction scripts,
  // served verbatim — not held to the new project's lint rules.
  { ignores: ['dist/', 'public/archive/'] },
  js.configs.recommended,
  ...tseslint.configs.recommended,
);
