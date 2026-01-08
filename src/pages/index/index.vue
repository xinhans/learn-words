<template>
	<view class="page-container">
		<!-- Custom Header -->
		<view class="header">
			<view class="user-info">
				<view class="avatar" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCgpycEiO67DZjCX7Nu-9wM2OUTsUvtokzk4xruzTRyPU3qB0FaS51bdeLA8FJL1rXbZJFHHkanm5cjZFepnrhxZtJL0GHR2G1cnMyf3TlKCIuWyGb7211OTQutIMPsNKkfd-zlP6RD7kpBkilEo8AQbjEDt4XV-8sCDmsnCD8LRYXFkIPfML9b3FlRAjRBnBotbKPj3WrOG2Cd-3-krvpDxbsYtED_4vdi6yLGFDuR4ZI82bBeLKwfRlH2AI-NbxWNDuH6lCxBQ');"></view>
				<view>
					<text class="greeting">晚上好</text>
					<text class="username">Alex</text>
				</view>
			</view>
			<button class="icon-button" @click="handleNotifications">
				<text class="i-mdi-bell"></text>
			</button>
		</view>

		<!-- Main Content -->
		<scroll-view scroll-y class="main-content">
			<!-- Learning Progress Section -->
			<view class="card progress-card">
				<view class="card-header">
					<view>
						<text class="card-title">学习进度</text>
						<text class="card-subtitle">已连续打卡 5 天，继续加油！</text>
					</view>
					<view class="icon-badge">
						<text class="i-mdi-trophy text-primary"></text>
					</view>
				</view>
				<view class="progress-details">
					<view class="progress-text">
						<text class="progress-count">15</text>
						<text class="progress-total">/20</text>
					</view>
					<text class="progress-label">今日新词</text>
				</view>
				<view class="progress-bar-container">
					<view class="progress-bar" style="width: 75%"></view>
				</view>
			</view>

			<!-- Daily Word Section -->
			<view class="section daily-word">
				<view class="section-header">
					<text class="section-title">每日一词</text>
					<button class="link-button" @click="handleViewHistory">查看往期</button>
				</view>
				<view class="word-card">
					<view class="word-card-bg" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBRHE0j54AmANklpzdYrZBBG5M3WubmGrMzRNVkAKRqMGF_gT9kY3y0Q1890PvFm6c4-qQ0eIfgXGImb7MXVcmvIEKZj_6FwR2z78VCY3E7XmGIE08fL9UqnWfRAv5-qt-_LWMCY8MxXTTBFHudr7Z92lj9bSdj_1GNKtt_t4B3cofIQAludPfWpDCOX3FGXmfQcZmOos-KJ8Z15cok17mOcOskKV8-v2BwKyNR-O0Aoryp_Qh8uW1RfvUjh0HXiEQ6160UGmJLIg');"></view>
					<view class="word-card-overlay"></view>
					<view class="word-card-content">
						<view class="word-info">
							<view>
								<text class="word-jp">一期一会</text>
								<text class="word-kana">いちごいちえ</text>
							</view>
							<button class="icon-button-light" @click="handlePlaySound">
								<text class="i-mdi-volume-high"></text>
							</button>
						</view>
						<text class="word-definition">一生只有一次的难得机缘。教导人们要珍惜当下的时光和眼前的人。</text>
					</view>
				</view>
			</view>

			<!-- Action Cards Section -->
			<view class="section action-cards">
				<button class="action-card primary-card" @click="navigateToLearn">
					<view class="card-icon-bg">
						<text class="i-mdi-book-open"></text>
					</view>
					<view>
						<text class="action-card-title text-white">开始学习</text>
						<text class="action-card-subtitle text-white-muted">10 个新词待学</text>
					</view>
				</button>
				<button class="action-card secondary-card" @click="navigateToReview">
					<view class="card-icon-bg-alt">
						<text class="i-mdi-refresh text-primary"></text>
					</view>
					<view>
						<text class="action-card-title">复习模式</text>
						<text class="action-card-subtitle">35 个需复习</text>
					</view>
				</button>
			</view>
		</scroll-view>
	</view>
</template>

<script setup>

const navigateToLearn = () => {
  console.log('Navigating to Learn page...');
  uni.navigateTo({
    url: '/pages/learn/learn'
  });
};

const navigateToReview = () => {
  console.log('Navigating to Review page...');
  uni.navigateTo({
    url: '/pages/review/review'
  });
};

const handleNotifications = () => {
  console.log('Notifications button clicked.');
  uni.showToast({ title: '通知功能待开发', icon: 'none' });
};

const handleViewHistory = () => {
  console.log('View history clicked.');
  uni.showToast({ title: '查看往期功能待开发', icon: 'none' });
};

const handlePlaySound = () => {
  console.log('Play sound clicked.');
  uni.showToast({ title: '播放声音功能待开发', icon: 'none' });
};
</script>

<style>
.page-container {
	min-height: 100vh;
	background-color: var(--background-light);
	padding-bottom: 120rpx;
}

/* Header */
.header {
	position: sticky;
	top: 0;
	z-index: 10;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20rpx 32rpx;
	background-color: rgba(246, 248, 247, 0.95);
	backdrop-filter: blur(8px);
}
.user-info {
	display: flex;
	align-items: center;
	gap: 24rpx;
}
.avatar {
	width: 80rpx;
	height: 80rpx;
	border-radius: 50%;
	background-size: cover;
	background-position: center;
	border: 4rpx solid rgba(57, 224, 121, 0.2);
}
.greeting {
	font-size: 24rpx;
	color: #64748b;
}
.username {
	font-size: 36rpx;
	font-weight: 700;
	line-height: 1.2;
}
.icon-button {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 80rpx;
	height: 80rpx;
	border-radius: 50%;
	background-color: transparent;
	border: none;
	padding: 0;
}
.icon-button:hover {
	background-color: rgba(0,0,0,0.05);
}


/* Main Content */
.main-content {
	padding: 0 32rpx;
	display: flex;
	flex-direction: column;
	gap: 48rpx;
}

/* Cards */
.card {
	background-color: var(--surface-light);
	border-radius: 24rpx;
	padding: 40rpx;
	border: 1rpx solid #e5e7eb;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
}
.card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 24rpx;
}
.card-title {
	font-size: 32rpx;
	font-weight: 700;
}
.card-subtitle {
	font-size: 24rpx;
	color: #64748b;
}
.icon-badge {
	width: 64rpx;
	height: 64rpx;
	border-radius: 50%;
	background-color: rgba(57, 224, 121, 0.1);
	display: flex;
	align-items: center;
	justify-content: center;
}
.text-primary {
	color: var(--primary);
}

/* Progress Card */
.progress-details {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}
.progress-text {
	display: flex;
	align-items: baseline;
}
.progress-count {
	font-size: 60rpx;
	font-weight: 700;
	color: var(--primary);
}
.progress-total {
	font-size: 36rpx;
	color: #9ca3af;
	font-weight: 500;
}
.progress-label {
	font-size: 28rpx;
	font-weight: 500;
	color: #64748b;
}
.progress-bar-container {
	width: 100%;
	height: 24rpx;
	border-radius: 9999px;
	background-color: #f3f4f6;
	overflow: hidden;
	margin-top: 16rpx;
}
.progress-bar {
	height: 100%;
	border-radius: 9999px;
	background-color: var(--primary);
}

/* Daily Word */
.section {
	display: flex;
	flex-direction: column;
	gap: 24rpx;
}
.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 8rpx;
}
.section-title {
	font-size: 40rpx;
	font-weight: 700;
}
.link-button {
	font-size: 28rpx;
	font-weight: 500;
	color: var(--primary);
	background: none;
	border: none;
	padding: 0;
}
.word-card {
	position: relative;
	overflow: hidden;
	border-radius: 24rpx;
	min-height: 440rpx;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
}
.word-card-bg {
	position: absolute;
	inset: 0;
	background-size: cover;
	background-position: center;
}
.word-card-overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(to top, rgba(0,0,0,0.9), rgba(0,0,0,0.5), transparent);
}
.word-card-content {
	position: relative;
	z-index: 2;
	padding: 40rpx;
	color: white;
}
.word-info {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}
.word-jp {
	font-size: 60rpx;
	font-weight: 700;
	color: white;
}
.word-kana {
	font-size: 36rpx;
	font-weight: 500;
	color: rgba(255,255,255,0.9);
	margin-top: 8rpx;
}
.icon-button-light {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 80rpx;
	height: 80rpx;
	border-radius: 50%;
	background-color: rgba(255,255,255,0.1);
	backdrop-filter: blur(4px);
	border: none;
	padding: 0;
	color: white;
}
.word-definition {
	margin-top: 24rpx;
	font-size: 28rpx;
	line-height: 1.6;
	color: #e5e7eb;
}

/* Action Cards */
.action-cards {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 32rpx;
}
.action-card {
	position: relative;
	overflow: hidden;
	border-radius: 24rpx;
	padding: 40rpx;
	text-align: left;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	gap: 48rpx;
	min-height: 280rpx;
	border: none;
}
.primary-card {
	background-color: var(--primary);
	box-shadow: 0 8rpx 20rpx rgba(57, 224, 121, 0.2);
}
.secondary-card {
	background-color: var(--surface-light);
	border: 1rpx solid #e5e7eb;
}
.card-icon-bg {
	width: 80rpx;
	height: 80rpx;
	border-radius: 16rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: rgba(255,255,255,0.2);
	color: white;
}
.card-icon-bg-alt {
	width: 80rpx;
	height: 80rpx;
	border-radius: 16rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f3f4f6;
}
.action-card-title {
	font-size: 36rpx;
	font-weight: 700;
}
.text-white {
	color: white;
}
.action-card-subtitle {
	font-size: 24rpx;
	margin-top: 8rpx;
	color: #64748b;
}
.text-white-muted {
	color: rgba(255,255,255,0.8);
}
</style>
