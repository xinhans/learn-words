# 日语单词学习应用

一个基于 uni-app 开发的现代化日语单词学习应用，支持多平台部署（H5、小程序等）。

## 🛠️ 技术栈

- **框架**: uni-app 3.0
- **前端**: Vue 3 (Composition API)
- **语言**: JavaScript
- **样式**: CSS3 (CSS Variables)、UnoCSS + @unocss-applet (小程序适配)
- **图标**: Material Design Icons (MDI)
- **构建工具**: Vite
- **国际化**: vue-i18n (支持多语言)

## 📁 项目结构

```
├── src/
│   ├── components/            # 通用组件
│   ├── pages/                  # 页面组件
│   │   ├── index/             # 首页
│   │   ├── learn/             # 学习页面
│   │   ├── review/            # 复习页面
│   │   ├── word-bank/         # 词库页面
│   │   └── profile/           # 个人中心
│   ├── store/                 # 状态管理
│   │   └── index.js           # 全局状态
│   ├── utils/                 # 工具函数
│   │   └── request.js         # 网络请求
│   ├── static/                # 静态资源
│   │   └── logo.png           # 应用图标
│   ├── ref/                   # 参考资料或示例
│   ├── App.vue                # 根组件
│   ├── main.js                # 入口文件
│   ├── pages.json             # 页面配置
│   ├── manifest.json          # 应用配置
│   └── uni.scss               # 全局样式
├── dist/                      # 构建输出目录
├── index.html                 # HTML 入口
├── package.json               # 项目依赖
├── vite.config.js             # Vite 配置
├── unocss.config.js           # UnoCSS 配置
└── .gitignore                 # Git 忽略文件
```

## 🚀 快速开始

### 环境要求
- Node.js >= 14.0.0
- npm >= 6.0.0

### 安装依赖

```bash
# 安装项目依赖
npm install
```

### 开发环境

```bash
# 启动 H5 开发服务器
npm run dev:h5

# 或指定其他平台开发环境
npm run dev:mp-weixin   # 微信小程序
npm run dev:mp-alipay   # 支付宝小程序
npm run dev:app-plus    # App 平台
```

开发服务器启动后，在浏览器中访问：`http://localhost:5173/`

### 生产构建

```bash
# 构建 H5 版本
npm run build:h5

# 或指定其他平台
npm run build:mp-weixin   # 微信小程序
npm run build:mp-alipay   # 支付宝小程序
npm run build:app-plus    # App 平台
```

构建产物将输出到 `dist/build/` 目录下。

## 📦 部署方式

### H5 部署

1. 构建 H5 版本
   ```bash
   npm run build:h5
   ```

2. 部署到服务器
   - 将 `dist/build/h5/` 目录下的所有文件上传到您的 Web 服务器
   - 确保服务器支持 SPA 应用的路由模式（需要配置 404 页面指向 index.html）

### 小程序部署

1. 构建对应平台的小程序版本
   ```bash
   # 微信小程序
   npm run build:mp-weixin
   ```

2. 使用对应平台的开发者工具导入构建后的项目
   - 微信小程序：使用微信开发者工具导入 `dist/build/mp-weixin/` 目录
   - 支付宝小程序：使用支付宝开发者工具导入 `dist/build/mp-alipay/` 目录

3. 按照平台要求完成审核和发布

### App 部署

1. 构建 App 版本
   ```bash
   npm run build:app-plus
   ```

2. 使用 HBuilderX 打开构建后的项目
3. 按照 HBuilderX 的指引完成打包和发布

## 🎨 界面设计

### 主题色
- 主色调：`#39E079`（绿色）
- 背景色：`#f6f8f7`（浅灰色）
- 卡片色：`#ffffff`（白色）
- 辅助色：`#ec4899`（粉色，用于假名）

### 字体
- 主要字体：`Lexend`, `Noto Sans SC`, `Noto Sans JP`
- 日语专用字体：`Noto Sans JP`

## 🔧 配置说明

### 页面配置
修改 `src/pages.json` 文件可以配置页面路由、底部导航栏等。

### 全局状态
修改 `src/store/index.js` 文件可以管理全局状态。

### 样式变量
修改 `src/App.vue` 中的 CSS 变量可以自定义主题。

### UnoCSS 配置
修改 `unocss.config.js` 文件可以配置 UnoCSS 的预设和转换器：

```javascript
import { defineConfig } from 'unocss'
import { presetApplet } from '@unocss-applet/preset-applet'
import presetIcons from '@unocss/preset-icons'
import transformerApplet from '@unocss-applet/transformer-applet'

export default defineConfig({
  presets: [
    presetApplet(), // 适配小程序的预设
    presetIcons({
      scale: 1, // 图标缩放比例
      warn: true, // 图标不存在时显示警告
    }), // 图标预设
  ],
  transformers: [
    transformerApplet(), // 小程序转换器
  ],
})
```

#### 使用 Material Design Icons
项目使用 Material Design Icons (MDI) 图标库，可以通过以下方式使用：

```vue
<!-- 示例：使用 bell 图标 -->
<text class="i-mdi-bell"></text>
```

图标名称可以在 [Material Design Icons](https://materialdesignicons.com/) 官网查找。

## 📝 开发注意事项

1. **图片资源**：
   - 建议将图片资源放在 `src/static/` 目录下
   - 避免使用外部图片链接（可能被浏览器安全策略阻止）

2. **跨平台兼容**：
   - 使用 uni-app 提供的 API 替代原生 API
   - 注意不同平台的样式差异

3. **性能优化**：
   - 使用懒加载减少初始加载时间
   - 合理使用缓存

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

## 📞 联系方式

如有问题或建议，请通过以下方式联系：
- 提交 Issue
- 发送邮件

---

**开始您的日语学习之旅吧！** 🎉