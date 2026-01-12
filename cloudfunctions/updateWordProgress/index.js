// 云函数入口文件
const cloud = require('wx-server-sdk')

cloud.init({
  env: cloud.DYNAMIC_CURRENT_ENV
})

const db = cloud.database()

// 云函数入口函数
exports.main = async (event, context) => {
  try {
    const { wordId, progress } = event
    const wxContext = cloud.getWXContext()
    const openid = wxContext.OPENID
    
    // 更新或创建用户单词进度记录
    await db.collection('user_word_progress').doc(`${openid}_${wordId}`).set({
      data: {
        user_id: openid,
        word_id: wordId,
        progress: progress,
        status: progress === 100 ? '已掌握' : progress > 70 ? '学习中' : progress > 30 ? '复习' : '新词',
        updated_at: db.serverDate()
      }
    })
    
    return {
      code: 0,
      message: '更新成功'
    }
  } catch (err) {
    console.error('更新学习进度失败', err)
    return {
      code: -1,
      message: '更新失败',
      error: err
    }
  }
}