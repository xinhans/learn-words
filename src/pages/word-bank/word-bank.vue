<template>
	<view class="page-container">
		<!-- Custom Header -->
		<view class="header">
			<text class="header-title">词库</text>
			<button class="icon-button">
				<text class="i-mdi-plus text-primary"></text>
			</button>
		</view>

		<!-- Search Bar -->
		<view class="search-bar-container">
			<view class="search-bar">
				<text class="i-mdi-magnify search-icon"></text>
				<input class="search-input" placeholder="搜索单词、假名、释义..." />
			</view>
		</view>

		<!-- Filter Chips -->
		<scroll-view scroll-x class="filter-chips-container" :show-scrollbar="false">
			<button class="chip active">
				<text class="i-mdi-history chip-icon"></text>
				<text>最近添加</text>
			</button>
			<button class="chip">
				<text class="i-mdi-sort-alphabetical-ascending chip-icon"></text>
				<text>五十音</text>
			</button>
			<button class="chip">
				<text class="i-mdi-trending-up chip-icon"></text>
				<text>学习进度</text>
			</button>
			<button class="chip">
				<text class="i-mdi-bookmark chip-icon"></text>
				<text>仅收藏</text>
			</button>
		</scroll-view>

		<!-- Word List -->
		<scroll-view scroll-y class="word-list">
			<view v-for="word in words" :key="word.id" class="word-item-card">
				<view class="word-item-main">
					<view class="word-item-header">
						<text class="word-item-title jp-font">{{ word.word }}</text>
						<text :class="['status-badge', getStatusClass(word.status)]">{{ word.status }}</text>
					</view>
					<view class="word-item-details">
						<text class="word-item-kana">{{ word.kana }}</text>
						<text class="word-item-meaning">{{ word.meaning }}</text>
					</view>
				</view>
				<view class="word-item-progress">
					<text class="progress-percentage" :style="{ color: word.progress > 0 ? 'var(--primary)' : '#9ca3af' }">{{ word.progress }}%</text>
					<view class="progress-bar-container">
						<view class="progress-bar" :style="{ width: getProgressWidth(word.progress) }"></view>
					</view>
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script setup>
import { computed } from 'vue'
import store from '../../store'

const words = computed(() => store.words);

const getStatusClass = (status) => {
	switch (status) {
		case '已掌握': return 'status-green';
		case '学习中': return 'status-blue';
		case '新词': return 'status-gray';
		case '复习': return 'status-amber';
		case '已收藏': return 'status-purple';
		default: return '';
	}
};

const getProgressWidth = (progress) => {
    // Ensure there's a minimum visible width for progress > 0
    if (progress > 0 && progress < 5) return '5%';
    return `${progress}%`;
}
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
	padding: 20rpx 32rpx;
	background-color: rgba(246, 248, 247, 0.9);
	backdrop-filter: blur(8px);
	border-bottom: 1rpx solid transparent;
}
.header-title {
	font-size: 40rpx;
	font-weight: 700;
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
	transition: background-color 0.2s;
}
.icon-button:hover {
	background-color: #e5e7eb;
}
.text-primary {
	color: var(--primary);
	font-size: 48rpx;
}

/* Search Bar */
.search-bar-container {
	padding: 16rpx 32rpx;
	position: sticky;
	top: 104rpx; /* Height of header */
	z-index: 10;
	background-color: var(--background-light);
}
.search-bar {
	position: relative;
}
.search-icon {
	position: absolute;
	left: 24rpx;
	top: 50%;
	transform: translateY(-50%);
	color: #9ca3af;
	font-size: 44rpx;
}
.search-input {
	width: 100%;
	height: 96rpx;
	padding-left: 80rpx;
	padding-right: 24rpx;
	border-radius: 24rpx;
	background-color: white;
	border: none;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
	font-size: 32rpx;
}
.search-input:focus {
	outline: 2px solid var(--primary);
}

/* Filter Chips */
.filter-chips-container {
	display: flex;
	padding: 16rpx 32rpx;
	gap: 24rpx;
	white-space: nowrap;
}
.chip {
	display: inline-flex;
	align-items: center;
	gap: 8rpx;
	height: 72rpx;
	padding: 0 32rpx;
	border-radius: 16rpx;
	font-size: 28rpx;
	font-weight: 500;
	background-color: white;
	border: 1rpx solid #e5e7eb;
	color: #4b5563;
	transition: all 0.2s;
	margin-right: 16rpx;
}
.chip.active {
	background-color: var(--primary);
	color: white;
	border-color: var(--primary);
	box-shadow: 0 4rpx 12rpx rgba(57, 224, 121, 0.2);
}
.chip-icon {
	font-size: 36rpx;
}

/* Word List */
.word-list {
	padding: 16rpx 32rpx;
	display: flex;
	flex-direction: column;
	gap: 24rpx;
}
.word-item-card {
	background-color: white;
	border-radius: 32rpx;
	padding: 32rpx;
	box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.05);
	border: 1rpx solid #f3f4f6;
	display: flex;
	align-items: center;
	justify-content: space-between;
	transition: transform 0.2s;
}
.word-item-card:active {
	transform: scale(0.98);
}
.word-item-main {
	flex: 1;
	min-width: 0;
	margin-right: 32rpx;
}
.word-item-header {
	display: flex;
	align-items: center;
	gap: 16rpx;
	margin-bottom: 8rpx;
}
.word-item-title {
	font-size: 40rpx;
	font-weight: 700;
	color: #111827;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.status-badge {
	display: inline-flex;
	align-items: center;
	padding: 4rpx 16rpx;
	border-radius: 9999px;
	font-size: 20rpx;
	font-weight: 500;
	flex-shrink: 0;
}
.status-green { background-color: #d1fae5; color: #065f46; }
.status-blue { background-color: #dbeafe; color: #1e40af; }
.status-gray { background-color: #f3f4f6; color: #4b5563; }
.status-amber { background-color: #fef3c7; color: #92400e; }
.status-purple { background-color: #ede9fe; color: #5b21b6; }

.word-item-details {
	display: flex;
	flex-direction: column;
	gap: 4rpx;
}
.word-item-kana {
	font-size: 24rpx;
	color: var(--primary);
	font-weight: 500;
}
.word-item-meaning {
	font-size: 28rpx;
	color: var(--secondary-text-light);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.word-item-progress {
	flex-shrink: 0;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	gap: 12rpx;
}
.progress-percentage {
	font-size: 24rpx;
	font-weight: 700;
}
.progress-bar-container {
	width: 128rpx;
	height: 12rpx;
	background-color: #f3f4f6;
	border-radius: 9999px;
	overflow: hidden;
}
.progress-bar {
	height: 100%;
	background-color: var(--primary);
	border-radius: 9999px;
}
</style>
