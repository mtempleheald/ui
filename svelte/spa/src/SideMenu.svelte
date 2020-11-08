<script>

	let categories = [
		{
			"title": "Question Set",
			"href": "#"
		},
		{
			"title": "Category 1", 
			"href": "#",
			"children": [
				{
					"title": "Subcategory 1.1",
					"href": "#"
				},
				{
					"title": "Subcategory 1.2",
					"href": "#"
				}
			]
		},
		{
			"title": "Category 2", 
			"href": "/",
			"children": [
				{
					"title": "Subcategory 2.1",
					"href": "#"
				},
				{
					"title": "Subcategory 2.2",
					"href": "#"
				}
			]
		},
		{
			"title": "Category 3", 
			"href": "#"
		}
	];
	export let active;
	function activeclass(compareString) {
		return (compareString == active) ? "active" : ""
	}
</script>


<style>
	nav {
		width: var(--menu-width);
		height: calc(100vh - var(--header-height));
		background-color: var(--main-bg-color);
		color: var(--frame-text-color);
	}
	nav ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	nav ul li.active {
		background-color: lightblue;
	}
	nav ul li ul {
		display: none;
	}
	nav ul li.active ul {
		display: inherit;
	}
</style>


<nav>
	<ul>
		{#each categories as cat}
			<li class="{activeclass(cat.title)}">
				<a href="{cat.href}">{cat.title}</a>							
				{#if cat.children}
					<ul>
					{#each cat.children as subcat}
					<li>
						<a href="{subcat.href}">{subcat.title}</a></li>
					{/each}
					</ul>
				{/if}
			</li>
		{/each}
	</ul>
</nav>