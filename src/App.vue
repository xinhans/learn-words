<script>
export default {
	onLaunch: function () {
		console.log('App Launch')
	},
	onShow: function () {
		console.log('App Show')
	},
	onHide: function () {
		console.log('App Hide')
	}
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700&family=Noto+Sans+JP:wght@300;400;500;700&family=Noto+Sans+SC:wght@300;400;500;700&display=swap');

:root {
  --primary: #39E079;
  --background-light: #f6f8f7;
  --background-dark: #122017;
  --surface-light: #ffffff;
  --surface-dark: #1b2631;
  --secondary-text-light: #64748b;
  --secondary-text-dark: #94a3b8;
  --kana-text: #ec4899;
}

page {
  font-family: 'Lexend', 'Noto Sans SC', 'Noto Sans JP', sans-serif;
  background-color: var(--background-light);
  color: #111827;
}
.jp-font {
    font-family: 'Noto Sans JP', sans-serif;
}
</style>
