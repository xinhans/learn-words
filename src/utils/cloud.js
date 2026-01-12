// 云开发工具类

/**
 * 调用云函数
 * @param {string} functionName - 云函数名称
 * @param {Object} data - 传递给云函数的参数
 * @returns {Promise} - 返回云函数调用结果
 */
export function callCloudFunction(functionName, data = {}) {
  return new Promise((resolve, reject) => {
    // #ifdef MP-WEIXIN
    wx.cloud.callFunction({
      name: functionName,
      data: data,
      success: res => {
        resolve(res.result);
      },
      fail: err => {
        console.error(`云函数调用失败: ${functionName}`, err);
        reject(err);
      }
    });
    // #endif
    // #ifndef MP-WEIXIN
    // 非微信小程序环境下的模拟实现
    console.warn('非微信小程序环境，云函数调用模拟实现');
    resolve({ mock: true, functionName, data });
    // #endif
  });
}

/**
 * 获取云数据库实例
 * @returns {Object} - 云数据库实例
 */
export function getCloudDatabase() {
  // #ifdef MP-WEIXIN
  return wx.cloud.database();
  // #endif
  // #ifndef MP-WEIXIN
  // 非微信小程序环境下的模拟实现
  console.warn('非微信小程序环境，返回模拟数据库实例');
  return {
    collection: (name) => ({
      name,
      get: () => Promise.resolve({ data: [], errMsg: 'mock get success' }),
      where: () => this,
      doc: () => this,
      add: () => Promise.resolve({ _id: 'mock_id', errMsg: 'mock add success' }),
      update: () => Promise.resolve({ errMsg: 'mock update success' }),
      remove: () => Promise.resolve({ errMsg: 'mock remove success' })
    })
  };
  // #endif
}

/**
 * 获取云存储实例
 * @returns {Object} - 云存储实例
 */
export function getCloudStorage() {
  // #ifdef MP-WEIXIN
  return wx.cloud;
  // #endif
  // #ifndef MP-WEIXIN
  // 非微信小程序环境下的模拟实现
  console.warn('非微信小程序环境，返回模拟存储实例');
  return {
    uploadFile: () => Promise.resolve({ fileID: 'mock_file_id', errMsg: 'mock upload success' }),
    downloadFile: () => Promise.resolve({ tempFilePath: 'mock_temp_path', errMsg: 'mock download success' }),
    deleteFile: () => Promise.resolve({ errMsg: 'mock delete success' })
  };
  // #endif
}

// 导出常用的云开发对象
export const db = getCloudDatabase();
export const storage = getCloudStorage();
export const cloud = {
  callFunction: callCloudFunction,
  database: getCloudDatabase,
  storage: getCloudStorage
};