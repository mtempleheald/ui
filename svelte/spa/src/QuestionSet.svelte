<script>
	import TextQuestion from './TextQuestion.svelte';
	import { questionSet } from './stores';
	import snarkdown from 'snarkdown';// https://github.com/developit/snarkdown/blob/master/test/index.js

	const qs = [
    {
      "id" : 1,
      "label": "Question 1",
      "type": "TextQuestion",
      "placeholder": "Placeholder...",
      "help": "Help text",
      "pre": "# Markdown before question 1",
      "post": "__Markdown after question 2__"
    },
    {
      "id" : 2,
      "label": "Question 2",
      "type": "TextQuestion"
    }
	];
	// TODO - pull this from an external API (Back office tooling)
	questionSet.set(qs);
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
	<div slot="pre">
		{#if q.pre}
		  {@html snarkdown(q.pre)}
		{/if}
	</div>
	<div slot="post">
	{#if q.post}
		  {@html snarkdown(q.post)}
		{/if}	
	</div>
</TextQuestion>
{/if}
{/each}