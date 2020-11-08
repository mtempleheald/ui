<script>
	import BreadcrumbNav from './BreadcrumbNav.svelte';
import Header from './Header.svelte';
	import QuestionSet from './QuestionSet.svelte';
	import SideMenu from './SideMenu.svelte';
	let title = "Category 1";
</script>

<style>
	:root {
  	--menu-width: 200px;
		--header-height: 75px;
		--breadcrumb-height: 2em;
		--main-bg-color: cornflowerblue;
		--frame-text-color: white;
		--content-bg-color: white;
		--content-text-color: #304960;
	}
	:global(body) {
		padding: 0px;
		overflow-x: hidden;
		font-family: Verdana, Geneva, Tahoma, sans-serif;
	}

	
	main {
		width: calc(100% - var(--menu-width));
		height: calc(100vh - var(--header-height) - var(--breadcrumb-height));
		position: absolute;
		top: calc(var(--header-height) + var(--breadcrumb-height));
		left: var(--menu-width);
		background-color: var(--content-bg-color);
		color: var(--content-text-color);
	}
	footer {
		clear: left;
		width: 100vw;
		background-color:  var(--content-bg-color);
		min-height: 20vh;
	}
</style>

<Header
	title="Question Set"
>
</Header>
	<SideMenu
	  active = "Question Set"
	></SideMenu>
	<BreadcrumbNav></BreadcrumbNav>
	<main>
		<QuestionSet></QuestionSet>		
	</main>
<footer>
	<p>Some legal nonsense goes here, plus sitemap etc if you feel so inclined</p>
</footer>
