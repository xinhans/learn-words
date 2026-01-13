<script>
export default {
	onLaunch: function () {
		console.log('App Launch')
	},
	onShow: function () {
		console.log('App Show')
	},
	onHide: function () {
		console.log('App Hide')
	}
}
</script>

<style>

:root {
  --primary: #39E079;
  --background-light: #f6f8f7;
  --background-dark: #122017;
  --surface-light: #ffffff;
  --surface-dark: #1b2631;
  --secondary-text-light: #64748b;
  --secondary-text-dark: #94a3b8;
  --kana-text: #ec4899;
  --spacing-xs: 16rpx;
  --spacing-sm: 20rpx;
  --spacing-base: 32rpx;
  --spacing-lg: 40rpx;
  --spacing-xl: 48rpx;
}

body {
  background-color: var(--background-light);
}

.scroll-view {
  flex: 1;
}

/* 统一卡片样式 */
.card {
  background-color: var(--surface-light);
  border-radius: 24rpx;
  padding: var(--spacing-lg);
  border: 1rpx solid #e5e7eb;
  box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
}
</style>
