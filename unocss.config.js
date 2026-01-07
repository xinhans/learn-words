import { defineConfig } from 'unocss'
import { presetApplet } from '@unocss-applet/preset-applet'
import presetIcons from '@unocss/preset-icons'
import transformerApplet from '@unocss-applet/transformer-applet'

export default defineConfig({
  presets: [
    presetApplet(),
    presetIcons({
      scale: 1.2,
      warn: true,
      collections: {
        mdi: () => import('@iconify-json/mdi/icons.json').then(i => i.default),
      },
    }),
  ],
  transformers: [
    transformerApplet(),
  ],
})
