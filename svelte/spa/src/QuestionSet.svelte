<script>
	import TextQuestion from './TextQuestion.svelte';
	import { questionSet } from './stores';
</script>


<style>

</style>


{#each $questionSet as q}
{#if q.type == "TextQuestion"}
	<TextQuestion
		id="{q.id}"
		label="{q.label}"
		placeholder="{q.placeholder ?? ''}"
		help="{q.help ?? ''}"
	>
	<p slot="pre">{q.pre ?? ''}</p>
	<p slot="post">{q.post ?? ''}</p>
	</TextQuestion>
{/if}
{/each}