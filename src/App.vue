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

page {
  background-color: var(--background-light);
  color: #111827;
  margin: 0;
  padding: 0;
}

/* 统一页面容器样式 */
.page-container {
  min-height: 100vh;
  background-color: var(--background-light);
  padding-bottom: 120rpx; /* 为底部导航栏留出空间 */
}

/* 统一头部样式 */
.header {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--spacing-sm) var(--spacing-base);
  background-color: rgba(246, 248, 247, 0.95);
  backdrop-filter: blur(8px);
}

/* 统一主内容区域样式 */
.main-content {
  padding: 0 var(--spacing-base);
  display: flex;
  flex-direction: column;
  gap: 48rpx;
}

/* 统一滚动视图样式 */
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
