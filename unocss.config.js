import { defineConfig } from 'unocss'
import { presetApplet } from '@unocss-applet/preset-applet'
import presetIcons from '@unocss/preset-icons'
import transformerApplet from '@unocss-applet/transformer-applet'

export default defineConfig({
  presets: [
    presetApplet(),
    presetIcons({
      scale: 1,
      warn: true,
    }),
  ],
  transformers: [
    transformerApplet(),
  ],
})