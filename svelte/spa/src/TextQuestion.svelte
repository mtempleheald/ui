<script>
	export let id;
	export let label;
	export let help;
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
		border: 1px dashed var(--content-text-color);
	}
	.question.active, 
	.question:focus-within {
		background-color: khaki;
	}
</style>


<div class="question {active}" on:mouseenter={enter} on:mouseleave={leave} hovering={hovering}>
	<slot name="pre"></slot>
	<label for="{id}">{label}</label>
	<input placeholder="{placeholder}" type="text" id="{id}" name="{id}"/>
	{#if help}
		<span class="tooltip">{help}</span>
	{/if}
	<slot></slot>
	<slot name="post"></slot>
</div>
