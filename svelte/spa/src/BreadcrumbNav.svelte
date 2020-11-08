<script>

</script>


<style>
nav {
		width: calc(100% - var(--menu-width));
		height: var(--breadcrumb-height);
		position: absolute;
		top: var(--header-height);
		left: var(--menu-width);
		background-color: var(--content-bg-color);
		color: var(--content-text-color);
	}
	nav ol {		
		display: flex;
		flex-flow: row wrap;
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	nav li {
		display: inline-flex;
		margin: 5px;
	}
	nav li::before {
		content: "/";
		margin-right: 10px;
	}
	nav li:first-child::before {
		content: "";
	}
</style>


<nav>
	<ol>
		<li>Home</li>
		<li>Category TODO</li>
		<li>Sub Category TODO</li>
	</ol>
</nav>