<script>
	export let title;
</script>


<style>
	header {
		width: 100%;
		min-height: var(--header-height);
		background-color: var(--main-bg-color);
		color: var(--frame-text-color);
		display: flex;
		flex-direction: row;
	}
	header h1, header h2 {
		margin: 0 1em;
		line-height: var(--header-height);
	}	
</style>


<header>
	<img
		src="https://via.placeholder.com/200x50/2222DD/FFFFFF?Text=Company.logo"
		alt="company logo" />
	<h1>Multi purpose application</h1>
	<h2>{title}</h2>
</header>