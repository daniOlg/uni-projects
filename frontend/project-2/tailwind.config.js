/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'company-primary': '#d94a1e',
        'company-secondary': '#1e5889',
      },
    },
  },
  plugins: [],
}

