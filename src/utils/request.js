const BASE_URL = 'https://your-api-base-url.com'; // Replace with your actual API base URL
import { callCloudFunction } from './cloud.js';

/**
 * 统一请求工具
 * 支持传统API请求和云函数调用
 * @param {Object} options - 请求参数
 * @param {string} options.url - API路径（传统请求）
 * @param {string} options.functionName - 云函数名称（云函数调用）
 * @param {string} options.method - 请求方法（传统请求）
 * @param {Object} options.data - 请求数据
 * @returns {Promise} - 返回请求结果
 */
const request = (options) => {
	// 如果指定了functionName，则使用云函数调用
	if (options.functionName) {
		return callCloudFunction(options.functionName, options.data || {});
	}

	// 否则使用传统API请求
	return new Promise((resolve, reject) => {
		uni.request({
			url: BASE_URL + (options.url || ''),
			method: options.method || 'GET',
			data: options.data || {},
			header: {
				'Content-Type': 'application/json',
				// Add any other headers like Authorization tokens here
				// 'Authorization': 'Bearer ' + uni.getStorageSync('token'),
			},
			success: (res) => {
				if (res.statusCode >= 200 && res.statusCode < 300) {
					resolve(res.data);
				} else {
					reject(res);
				}
			},
			fail: (err) => {
				uni.showToast({
					title: '网络请求失败',
					icon: 'none'
				});
				reject(err);
			}
		});
	});
};

export default request;
