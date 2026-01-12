// 云函数入口文件
const cloud = require('wx-server-sdk')

cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

const db = cloud.database()

// 云函数入口函数
exports.main = async (event, context) => {
  try {
    // 获取单词列表
    const res = await db.collection('words').get()
    
    return {
      code: 0,
      message: '获取成功',
      data: res.data
    }
  } catch (err) {
    console.error('获取单词失败', err)
    return {
      code: -1,
      message: '获取失败',
      error: err
    }
  }
}