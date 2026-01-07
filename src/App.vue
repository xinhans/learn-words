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
@import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap');

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

.material-symbols-outlined {
    font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
.material-symbols-outlined.filled {
    font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
.jp-font {
    font-family: 'Noto Sans JP', sans-serif;
}
</style>
