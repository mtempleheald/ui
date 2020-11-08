<script>
	export let id;
	export let labelText;
	export let helpText;
	export let placeholder;
	let active;
	let hovering;
	function enter() {
		hovering = true;
		active = "active";
	}
	function leave() {
		hovering = false;
		active = "";
	}
</script>


<style>
	.question {
		background-color: lightblue;
	}
	.question.active, 
	.question:focus-within {
		background-color: khaki;
	}
</style>


<div class="question {active}" on:mouseenter={enter} on:mouseleave={leave} hovering={hovering}>
	<slot name="pre"></slot>
	<label for="{id}">{labelText}</label>
	<input placeholder="{placeholder}" type="text" id="{id}" name="{id}"/>
	{#if helpText}
		<span class="tooltip">{helpText}</span>
	{/if}
	<slot name="post"></slot>
</div>
