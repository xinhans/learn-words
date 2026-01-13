import { defineConfig } from 'unocss'
import { presetWeapp } from 'unocss-preset-weapp'
import presetIcons from '@unocss/preset-icons'

export default defineConfig({
  presets: [
    // 使用针对微信小程序的预设
    presetWeapp({
      // 配置为微信小程序环境
      platform: 'weapp'
    }),
    presetIcons({
      scale: 1,
      warn: true,
    }),
  ],
  output: {
    // 禁用自动注入，让uni-app来处理
    inject: false,
    // 配置输出格式，确保与微信小程序兼容
    preflights: false
  }
})