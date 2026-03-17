/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      colors: {
        accent: '#E53935',
      }
    },
  },
  plugins: [
    function({ addComponents }) {
      addComponents({
        '.premium-label': {
          '@apply text-[10px] font-bold text-white/40 uppercase tracking-[0.3em] block mb-3 md:mb-4 ml-1': {},
        },
        '.premium-input': {
          '@apply w-full bg-zinc-900 border-none rounded-xl py-4 md:py-5 px-6 md:px-8 text-white placeholder:text-white/10 focus:ring-2 focus:ring-[#E53935] transition-all outline-none': {},
        },
        '.premium-dropdown-trigger': {
          '@apply w-full bg-zinc-900 rounded-xl py-4 md:py-5 px-6 md:px-8 text-white flex justify-between items-center cursor-pointer hover:bg-zinc-800 transition-all shadow-lg select-none': {},
          '&.active': {
            '@apply ring-2 ring-[#E53935]': {},
          }
        },
        '.premium-dropdown-panel': {
          '@apply absolute top-full left-0 w-full mt-2 bg-zinc-950 border border-white/10 rounded-xl py-2 z-[60] shadow-2xl overflow-hidden font-serif italic text-lg shadow-accent/10': {},
        },
        '.premium-dropdown-item': {
          '@apply px-8 py-3 hover:bg-accent hover:text-white transition-colors cursor-pointer text-white/80': {},
        },
        '.premium-calendar-panel': {
          '@apply absolute top-full left-1/2 -translate-x-1/2 lg:left-0 lg:-translate-x-0 mt-2 w-80 sm:w-96 bg-zinc-950 border border-white/10 rounded-xl p-4 sm:p-8 z-[70] shadow-2xl shadow-accent/20': {},
        }
      })
    }
  ],
}
