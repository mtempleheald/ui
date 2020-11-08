<script>
	import TextQuestion from './TextQuestion.svelte';
</script>


<style>

</style>


<TextQuestion
	id="1"
	labelText="Question 1"
	helpText="help text"
>
	<p slot="pre">Markdown before question</p>
	<p slot="post">Markdown after question</p>
</TextQuestion>
<TextQuestion
	id="2"
	labelText="Question 2"
	placeholder="Placeholder..."
>
	<p slot="pre">Markdown before question</p>
	<p slot="post">Markdown after question</p>
</TextQuestion>