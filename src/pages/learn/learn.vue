<template>
	<view class="page-container">
		<!-- Header -->
		<view class="header">
			<button class="icon-button">
				<view class="i-mdi-arrow-left text-2xl" />
			</button>
			<view class="tabs">
				<button class="tab active">学习</button>
				<button class="tab">复习</button>
			</view>
			<button class="icon-button">
				<view class="i-mdi-tune-variant text-2xl" />
			</button>
		</view>

		<!-- Progress Bar -->
		<view class="progress-section">
			<view class="progress-header">
				<text class="progress-label">今日学习进度</text>
				<text class="progress-text">15<text class="progress-total">/50</text></text>
			</view>
			<view class="progress-bar-container">
				<view class="progress-bar" style="width: 30%;"></view>
			</view>
		</view>

		<!-- Word Card -->
		<view class="card-container">
			<view class="card-background-glow-1"></view>
			<view class="card-background-glow-2"></view>
			<view class="word-card">
				<view class="word-card-image" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBDgC3P4dDZp_eU-my3WwCsBwETmqbHxDnPrGvhbQ7YSVPrdRBILci-kAPdXnNKun9PQp6uNrFPnsUCF23ZwetEmr2OYmZSF-1a-fkxWPWF010CzA5ejh0o3QKruxCDUkML1EmjiYekHlzTwDxuZ9Ourha39W5wDC-m_0A-dRLtXn3CKxF8KuNynu0vwjMHFlgKj8A_3toDtPMMqTRhRy3B3x_6GzsKWS9ysxU577oarrxboxhahXuae0L5UkH0DJtWsMu2qwn0UQ');">
					<view class="image-overlay"></view>
					<button class="bookmark-button">
						<view class="i-mdi-bookmark-outline text-[36rpx]" />
					</button>
				</view>
				<scroll-view scroll-y class="word-details">
					<view class="word-info">
						<text class="word jp-font">木漏れ日</text>
						<view class="pronunciation">
							<text class="kana jp-font">こもれび [0]</text>
							<button class="volume-button">
								<view class="i-mdi-volume-high" />
							</button>
						</view>
					</view>
					<view class="divider"></view>
					<view class="definitions">
						<view class="definition-item">
							<text class="part-of-speech">名词 (n.)</text>
							<text class="meaning">树叶缝隙中漏下的阳光；林间透下的斑驳光影。</text>
						</view>
						<view class="example">
							<text class="example-jp jp-font">森の中で<text class="highlight">木漏れ日</text>がきれいだった。</text>
							<text class="example-cn">森林里透射下来的阳光真美。</text>
						</view>
					</view>
				</scroll-view>
			</view>
		</view>

		<!-- Action Buttons -->
		<view class="action-buttons">
			<button class="action-button unknown">
				<view class="i-mdi-close icon" />
				<text class="text">不认识</text>
			</button>
			<button class="action-button known">
				<text class="text">掌握</text>
				<view class="i-mdi-check icon" />
			</button>
		</view>
	</view>
</template>

<script setup>
</script>

<style>
.page-container {
	height: 100vh;
	display: flex;
	flex-direction: column;
	background-color: var(--background-light);
}

/* Header */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20rpx 32rpx;
	flex-shrink: 0;
}
.icon-button {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 80rpx;
	height: 80rpx;
	border-radius: 50%;
	background: none;
	border: none;
	padding: 0;
}
.tabs {
	display: flex;
	background-color: #e5e7eb;
	border-radius: 9999px;
	padding: 8rpx;
}
.tab {
	padding: 12rpx 48rpx;
	border-radius: 9999px;
	font-size: 28rpx;
	font-weight: 500;
	background: none;
	border: none;
	color: #6b7280;
}
.tab.active {
	background-color: white;
	color: #111827;
	font-weight: 700;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.1);
}

/* Progress Section */
.progress-section {
	padding: 16rpx 48rpx;
	flex-shrink: 0;
}
.progress-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 8rpx;
}
.progress-label {
	font-size: 24rpx;
	color: #6b7280;
}
.progress-text {
	font-size: 28rpx;
	font-weight: 700;
	color: var(--primary);
}
.progress-total {
	font-weight: 400;
	color: #9ca3af;
}
.progress-bar-container {
	width: 100%;
	height: 12rpx;
	background-color: #e5e7eb;
	border-radius: 9999px;
	overflow: hidden;
}
.progress-bar {
	height: 100%;
	background-color: var(--primary);
	border-radius: 9999px;
}

/* Card Container */
.card-container {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 32rpx;
	position: relative;
	min-height: 0;
}
.card-background-glow-1 {
	position: absolute;
	top: 80rpx;
	right: 80rpx;
	width: 400rpx;
	height: 400rpx;
	background-color: rgba(57, 224, 121, 0.05);
	border-radius: 50%;
	filter: blur(100rpx);
}
.card-background-glow-2 {
	position: absolute;
	bottom: 160rpx;
	left: 80rpx;
	width: 300rpx;
	height: 300rpx;
	background-color: rgba(168, 85, 247, 0.05);
	border-radius: 50%;
	filter: blur(100rpx);
}
.word-card {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 48rpx;
	box-shadow: 0 8px 30px rgba(0,0,0,0.04);
	border: 1rpx solid rgba(0,0,0,0.05);
	overflow: hidden;
	display: flex;
	flex-direction: column;
}
.word-card-image {
	width: 100%;
	height: 256rpx;
	background-size: cover;
	background-position: center;
	position: relative;
	flex-shrink: 0;
}
.image-overlay {
	position: absolute;
	inset: 0;
	background: linear-gradient(to bottom, transparent, white);
}
.bookmark-button {
	position: absolute;
	top: 32rpx;
	right: 32rpx;
	background-color: rgba(0,0,0,0.2);
	backdrop-filter: blur(4px);
	color: white;
	border-radius: 50%;
	width: 64rpx;
	height: 64rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0;
	border: none;
}
.word-details {
	flex: 1;
	padding: 16rpx 48rpx 32rpx;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.word-info {
	margin-bottom: 48rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 16rpx;
	width: 100%;
}
.word {
	font-size: 100rpx;
	font-weight: 800;
	letter-spacing: -2rpx;
}
.pronunciation {
	display: flex;
	align-items: center;
	gap: 24rpx;
	background-color: #f3f4f6;
	padding: 16rpx 32rpx;
	border-radius: 9999px;
	margin-top: 16rpx;
}
.kana {
	font-size: 36rpx;
	color: #4b5563;
}
.volume-button {
	color: var(--primary);
	background: none;
	border: none;
	padding: 0;
	display: flex;
	align-items: center;
}
.divider {
	width: 96rpx;
	height: 8rpx;
	background-color: #f3f4f6;
	border-radius: 9999px;
	margin-bottom: 48rpx;
	flex-shrink: 0;
}
.definitions {
	width: 100%;
	text-align: left;
	display: flex;
	flex-direction: column;
	gap: 48rpx;
}
.part-of-speech {
	display: inline-block;
	background-color: rgba(57, 224, 121, 0.1);
	color: var(--primary);
	padding: 4rpx 16rpx;
	border-radius: 8rpx;
	font-size: 24rpx;
	font-weight: 700;
	margin-bottom: 16rpx;
}
.meaning {
	font-size: 36rpx;
	line-height: 1.6;
	color: #374151;
}
.example {
	padding-left: 32rpx;
	border-left: 4rpx solid rgba(57, 224, 121, 0.3);
}
.example-jp {
	font-size: 32rpx;
	line-height: 1.5;
	margin-bottom: 8rpx;
}
.highlight {
	color: var(--primary);
}
.example-cn {
	font-size: 28rpx;
	color: #6b7280;
}

/* Action Buttons */
.action-buttons {
	display: flex;
	gap: 32rpx;
	padding: 24rpx 48rpx;
	flex-shrink: 0;
}
.action-button {
	flex: 1;
	height: 112rpx;
	border-radius: 32rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 36rpx;
	font-weight: 700;
	border: none;
	transition: all 0.2s;
}
.action-button.unknown {
	border: 4rpx solid #ffedd5;
	background-color: transparent;
	color: #f97316;
}
.action-button.known {
	background-color: var(--primary);
	color: white;
	box-shadow: 0 8rpx 20rpx rgba(57, 224, 121, 0.3);
}
.action-button .icon {
	font-size: 40rpx;
}
.action-button.unknown .icon { margin-right: 16rpx; }
.action-button.known .icon { margin-left: 16rpx; }
</style>
