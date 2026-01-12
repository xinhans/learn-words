import { createSSRApp } from "vue";
import App from "./App.vue";
import "uno.css";
export function createApp() {
	const app = createSSRApp(App);

	// #ifdef MP-WEIXIN
	// 微信小程序云开发初始化
	wx.cloud.init({
		env: 'wx8e38f09aa7d32e8e', // 替换为您的云开发环境ID
		traceUser: true
	});
	// #endif

	return {
		app,
	};
}
