<template>
	<view class="page-container">
		<!-- Custom Header -->
		<view class="header">
			<text class="header-title">我的</text>
			<button class="icon-button">
				<view class="i-mdi-bell-outline text-2xl" />
			</button>
		</view>

		<scroll-view scroll-y class="main-content">
			<!-- Profile Section -->
			<view class="profile-section">
				<view class="avatar-container">
					<view class="avatar-glow"></view>
					<view class="avatar" :style="{ backgroundImage: 'url(' + user.avatar + ')' }"></view>
					<button class="edit-button">
						<view class="i-mdi-pencil text-[36rpx]" />
					</button>
				</view>
				<view class="user-info">
					<text class="username">{{ user.name }}</text>
					<text class="signature">{{ user.signature }}</text>
				</view>
			</view>

			<!-- Stats Section -->
			<view class="stats-section">
				<view class="stat-card">
					<text class="stat-label">学习总时长</text>
					<view class="stat-value">
						<text class="stat-number">42</text>
						<text class="stat-unit">小时</text>
						<text class="stat-number">15</text>
						<text class="stat-unit">分</text>
					</view>
				</view>
				<view class="stat-card">
					<text class="stat-label">已学单词</text>
					<view class="stat-value">
						<text class="stat-number-primary">1,204</text>
						<text class="stat-unit">个</text>
					</view>
				</view>
			</view>

			<!-- Options Section -->
			<view class="options-section">
				<!-- Daily Goal Card -->
				<view class="option-card-progress">
					<view class="option-header">
						<view class="option-icon-bg primary">
							<view class="i-mdi-flag text-3xl" />
						</view>
						<view class="option-text">
							<text class="option-title">今日目标</text>
							<text class="option-subtitle">已完成 30 / 50 个单词</text>
						</view>
						<view class="i-mdi-chevron-right chevron" />
					</view>
					<view class="progress-bar-container">
						<view class="progress-bar" style="width: 60%;"></view>
					</view>
				</view>

				<!-- Menu List -->
				<view class="option-list">
					<button class="option-item">
						<view class="option-icon-bg orange">
							<view class="i-mdi-bell-ring-outline text-3xl" />
						</view>
						<text class="option-title">学习提醒</text>
						<view class="i-mdi-chevron-right chevron" />
					</button>
					<button class="option-item">
						<view class="option-icon-bg gray">
							<view class="i-mdi-cog-outline text-3xl" />
						</view>
						<text class="option-title">设置</text>
						<view class="i-mdi-chevron-right chevron" />
					</button>
					<button class="option-item">
						<view class="option-icon-bg purple">
							<view class="i-mdi-help-circle-outline text-3xl" />
						</view>
						<text class="option-title">帮助与反馈</text>
						<view class="i-mdi-chevron-right chevron" />
					</button>
				</view>

				<button class="logout-button">退出登录</button>
			</view>
		</scroll-view>
	</view>
</template>

<script setup>
import { computed } from 'vue'
import store from '../../store'

const user = computed(() => store.user);
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
	z-index: 20;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20rpx 48rpx;
	background-color: rgba(246, 248, 247, 0.8);
	backdrop-filter: blur(8px);
}
.header-title {
	font-size: 36rpx;
	font-weight: 700;
	text-align: center;
	flex-grow: 1;
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

/* Main Content */
.main-content {
	width: 100%;
}

/* Profile Section */
.profile-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 16rpx 48rpx 64rpx;
}
.avatar-container {
	position: relative;
	width: 224rpx;
	height: 224rpx;
}
.avatar-glow {
	position: absolute;
	inset: -8rpx;
	border-radius: 50%;
	background: linear-gradient(45deg, var(--primary), rgba(57, 224, 121, 0.2));
	filter: blur(8rpx);
	opacity: 0.5;
}
.avatar {
	position: relative;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	border: 8rpx solid var(--surface-light);
	background-size: cover;
	background-position: center;
}
.edit-button {
	position: absolute;
	bottom: 0;
	right: 0;
	width: 72rpx;
	height: 72rpx;
	border-radius: 50%;
	background-color: var(--primary);
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 6rpx solid var(--surface-light);
}
.user-info {
	text-align: center;
	margin-top: 32rpx;
}
.username {
	font-size: 48rpx;
	font-weight: 700;
	line-height: 1.2;
}
.signature {
	font-size: 28rpx;
	color: #64748b;
	margin-top: 8rpx;
}

/* Stats Section */
.stats-section {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 32rpx;
	padding: 0 48rpx 64rpx;
}
.stat-card {
	background-color: var(--surface-light);
	border-radius: 32rpx;
	padding: 40rpx;
	box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.05);
}
.stat-label {
	font-size: 28rpx;
	font-weight: 500;
	color: #64748b;
}
.stat-value {
	margin-top: 16rpx;
	display: flex;
	align-items: baseline;
	gap: 8rpx;
}
.stat-number {
	font-size: 48rpx;
	font-weight: 700;
}
.stat-number-primary {
	font-size: 52rpx;
	font-weight: 700;
	color: var(--primary);
}
.stat-unit {
	font-size: 28rpx;
	font-weight: 700;
	color: #9ca3af;
}

/* Options Section */
.options-section {
	display: flex;
	flex-direction: column;
	gap: 32rpx;
	padding: 0 48rpx;
}
.option-card-progress {
	background-color: var(--surface-light);
	border-radius: 32rpx;
	padding: 32rpx;
	box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.05);
}
.option-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}
.option-icon-bg {
	width: 96rpx;
	height: 96rpx;
	border-radius: 24rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
	color: var(--primary);
	background-color: rgba(57, 224, 121, 0.1);
}
.option-text {
	flex-grow: 1;
	margin: 0 32rpx;
}
.option-title {
	font-size: 32rpx;
	font-weight: 600;
}
.option-subtitle {
	font-size: 24rpx;
	color: #64748b;
}
.chevron {
	color: #9ca3af;
	font-size: 40rpx;
}
.progress-bar-container {
	margin-top: 24rpx;
	width: 100%;
	height: 16rpx;
	border-radius: 9999px;
	background-color: #f3f4f6;
	overflow: hidden;
}
.progress-bar {
	height: 100%;
	border-radius: 9999px;
	background-color: var(--primary);
}
.option-list {
	background-color: var(--surface-light);
	border-radius: 32rpx;
	overflow: hidden;
	box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.05);
}
.option-item {
	display: flex;
	align-items: center;
	padding: 32rpx;
	background-color: var(--surface-light);
	border: none;
	width: 100%;
	text-align: left;
}
.option-item:not(:last-child) {
	border-bottom: 1rpx solid #f3f4f6;
}
.option-item .option-icon-bg {
	width: 80rpx;
	height: 80rpx;
	border-radius: 50%;
	margin-right: 32rpx;
}
.option-item .option-title {
	flex-grow: 1;
}
.option-icon-bg.orange { background-color: #fff7ed; color: #fb923c; }
.option-icon-bg.gray { background-color: #f3f4f6; color: #4b5563; }
.option-icon-bg.purple { background-color: #f5f3ff; color: #a78bfa; }
.logout-button {
	width: 100%;
	border-radius: 32rpx;
	border: 1rpx solid rgba(239, 68, 68, 0.1);
	background-color: rgba(239, 68, 68, 0.05);
	padding: 28rpx;
	text-align: center;
	font-size: 28rpx;
	font-weight: 700;
	color: #ef4444;
}
</style>
