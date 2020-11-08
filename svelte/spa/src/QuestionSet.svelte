<script>
	import TextQuestion from './TextQuestion.svelte';
	import { questionSet } from './stores';
	const qs = [
    {
      "id" : 1,
      "label": "Question 1",
      "type": "TextQuestion",
      "placeholder": "Placeholder...",
      "help": "Help text",
      "pre": "Markdown before question",
      "post": "Markdown after question"
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
	<p slot="pre">{q.pre ?? ''}</p>
	<p slot="post">{q.post ?? ''}</p>
	</TextQuestion>
{/if}
{/each}