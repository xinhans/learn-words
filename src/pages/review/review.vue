<template>
	<view class="page-container">
		<!-- Header -->
		<view class="header">
			<button class="icon-button">
				<text class="i-mdi-close"></text>
			</button>
			<text class="header-title">复习模式</text>
			<button class="icon-button">
				<text class="i-mdi-cog"></text>
			</button>
		</view>

		<!-- Progress Bar -->
		<view class="progress-section">
			<view class="progress-header">
				<text class="progress-label">今日目标</text>
				<text class="progress-text">5<text class="progress-total">/20</text></text>
			</view>
			<view class="progress-bar-container">
				<view class="progress-bar" style="width: 25%;"></view>
			</view>
		</view>

		<!-- Main Content -->
		<view class="main-content">
			<!-- Question Area -->
			<view class="question-area">
				<view class="question-glow"></view>
				<view class="question-content">
					<text class="question-word jp-font">桜</text>
					<button class="pronunciation-button">
						<text class="i-mdi-volume-high icon"></text>
						<text class="kana jp-font">さくら</text>
					</button>
				</view>
			</view>

			<!-- Options -->
			<view class="options-container">
				<text class="options-label">请选择正确的释义</text>
				<button v-for="(option, index) in options" :key="index" class="option-button">
					<view class="option-index">{{ option.index }}</view>
					<text class="option-text">{{ option.text }}</text>
				</button>
			</view>
		</view>

		<!-- Help Button -->
		<view class="help-section">
			<button class="help-button">
				<text class="i-mdi-help-circle"></text>
				<text>不认识这个词</text>
			</button>
		</view>
	</view>
</template>

<script setup>
import { ref } from 'vue'

const options = ref([
	{ index: 'A', text: '樱花' },
	{ index: 'B', text: '梅花' },
	{ index: 'C', text: '枫叶' },
	{ index: 'D', text: '竹子' },
]);
</script>

<style>
.page-container {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	background-color: var(--background-light);
	padding-bottom: 140rpx; /* Space for nav bar */
}

/* Header */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20rpx 32rpx;
	position: sticky;
	top: 0;
	z-index: 10;
	background-color: rgba(246, 248, 247, 0.95);
	backdrop-filter: blur(8px);
}
.header-title {
	font-size: 36rpx;
	font-weight: 700;
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

/* Progress Section */
.progress-section {
	padding: 16rpx var(--spacing-base);
}
.progress-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 16rpx;
}
.progress-label {
	font-size: 28rpx;
	font-weight: 500;
	color: #6b7280;
}
.progress-text {
	font-size: 32rpx;
	font-weight: 700;
	color: var(--primary);
}
.progress-total {
	font-weight: 400;
	color: #9ca3af;
}
.progress-bar-container {
	width: 100%;
	height: 16rpx;
	background-color: #e5e7eb;
	border-radius: 9999px;
	overflow: hidden;
}
.progress-bar {
	height: 100%;
	background-color: var(--primary);
	border-radius: 9999px;
}

/* Main Content */
.main-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 0 var(--spacing-base);
	gap: 48rpx;
}
.question-area {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 360rpx;
	position: relative;
}
.question-glow {
	position: absolute;
	inset: 0;
	background: linear-gradient(to bottom, rgba(57, 224, 121, 0.05), transparent);
	border-radius: 48rpx;
}
.question-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 32rpx;
	padding: 64rpx;
}
.question-word {
	font-size: 96rpx;
	font-weight: 700;
	line-height: 1.2;
}
.pronunciation-button {
	display: flex;
	align-items: center;
	gap: 16rpx;
	padding: 16rpx 32rpx;
	border-radius: 9999px;
	background-color: white;
	border: 1rpx solid #e5e7eb;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
}
.pronunciation-button .icon {
	color: var(--primary);
	font-size: 40rpx;
}
.pronunciation-button .kana {
	font-size: 28rpx;
	color: #4b5563;
	font-weight: 500;
}

/* Options */
.options-container {
	display: flex;
	flex-direction: column;
	gap: 24rpx;
	width: 100%;
}
.options-label {
	text-align: center;
	color: #6b7280;
	font-size: 28rpx;
	margin-bottom: 16rpx;
}
.option-button {
	display: flex;
	align-items: center;
	width: 100%;
	padding: 32rpx;
	border-radius: 24rpx;
	background-color: white;
	border: 2rpx solid transparent;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
	text-align: left;
}
.option-button:hover {
	border-color: var(--primary);
	background-color: rgba(57, 224, 121, 0.05);
}
.option-index {
	width: 64rpx;
	height: 64rpx;
	flex-shrink: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 16rpx;
	background-color: #f3f4f6;
	color: #6b7280;
	font-weight: 700;
}
.option-button:hover .option-index {
	background-color: var(--primary);
	color: white;
}
.option-text {
	margin-left: 32rpx;
	font-size: 32rpx;
	font-weight: 500;
	color: #374151;
}
.option-button:hover .option-text {
	color: var(--primary);
}

/* Help Section */
.help-section {
	display: flex;
	justify-content: center;
	padding: 16rpx var(--spacing-base);
}
.help-button {
	display: flex;
	align-items: center;
	gap: 8rpx;
	padding: 16rpx 32rpx;
	border-radius: 16rpx;
	background: none;
	border: none;
	color: #9ca3af;
	font-size: 28rpx;
	font-weight: 600;
}
.help-button:hover {
	background-color: #f3f4f6;
	color: #4b5563;
}
.help-button .i-mdi {
	font-size: 36rpx;
}
</style>
