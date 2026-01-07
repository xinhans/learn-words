import { reactive } from 'vue';

const store = reactive({
  user: {
    name: '日语练习生',
    avatar: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDJNqQ3Be4PhUW77ec3RnE6QIYGPqusPN0-0mYjZi_5vMLoAGm-GzfQxk0BXmuXZJo8JHtQ3TMNvke5wSF9CPuq8xpjk1_JU70XiTld5aYHG3fJpTL79V3z2W20ARUTFVCurWvU6gaxcljSDvTgNZrn1vNH6YBeYg0ATpaSBm7mQ_0VwjiwAB-3rvLV6ZccA8a1o949dn3Go4YSz8-_HfHh5Dz7jMr9RonK15zNZZhr6ykSNvZJ0HOq40yU6UXOu7X1lqZXruYsXQ',
    signature: '每天进步一点点 💪',
  },
  words: [
    { id: 1, word: '約束', kana: 'やくそく', meaning: 'n. 约定，诺言，安排', status: '已掌握', progress: 100 },
    { id: 2, word: '紫陽花', kana: 'あじさい', meaning: 'n. 绣球花', status: '学习中', progress: 65 },
    { id: 3, word: '一生懸命', kana: 'いっしょうけんめい', meaning: 'adv. 拼命地，努力地', status: '新词', progress: 0 },
    { id: 4, word: '日進月歩', kana: 'にっしんげっぽ', meaning: 'n. 日新月异，突飞猛进', status: '复习', progress: 30 },
    { id: 5, word: '木漏れ日', kana: 'こもれび', meaning: 'n. 树叶间隙漏下的阳光', status: '学习中', progress: 45 },
    { id: 6, word: '諦める', kana: 'あきらめる', meaning: 'v. 放弃，死心', status: '已收藏', progress: 80 },
  ],
  // Add other global state properties here
});

export default store;
