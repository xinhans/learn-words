import { defineConfig } from 'vite'
import uni from '@dcloudio/vite-plugin-uni'
import unoCSS from 'unocss/vite'

// 自定义插件：将CSS文件重命名为WXSS文件
const cssToWxssPlugin = {
  name: 'css-to-wxss',
  enforce: 'post',
  generateBundle(options, bundle) {
    for (const fileName in bundle) {
      if (bundle[fileName].type === 'asset' && fileName.endsWith('.css')) {
        // 创建新的WXSS文件
        const wxssFileName = fileName.replace(/\.css$/, '.wxss')
        bundle[wxssFileName] = bundle[fileName]
        bundle[wxssFileName].fileName = wxssFileName
        // 删除旧的CSS文件
        delete bundle[fileName]
      }
    }
  }
}

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    unoCSS(),
    uni.default(),
    cssToWxssPlugin
  ]
})
