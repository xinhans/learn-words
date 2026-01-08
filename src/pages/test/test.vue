<template>
  <view class="test-container">
    <text class="text-2xl font-bold text-red-500 mb-4">UnoCSS 原子类测试</text>
    <view class="flex flex-col gap-2">
      <view class="bg-blue-500 text-white p-4 rounded-lg">背景色测试</view>
      <view class="border-2 border-green-500 p-4 rounded-lg">边框测试</view>
      <view class="flex justify-center items-center p-4 bg-gray-100 rounded-lg">
        <text class="text-xl font-semibold">Flex布局测试</text>
      </view>
      <view class="w-16 h-16 bg-yellow-400 rounded-full shadow-lg"></view>
    </view>
    <text class="text-green-600 mt-4">如果以上样式正常显示，则UnoCSS已生效！</text>
  </view>
</template>

<script>
export default {
  name: 'TestPage'
}
</script>

<style scoped>
.test-container {
  padding: 20px;
}
</style>