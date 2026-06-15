<script lang="ts">
	let { children } = $props();
</script>

<style>
	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-Regular.ttf') format('truetype');
		font-weight: 400;
		font-style: normal;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-ExtraBold.ttf') format('truetype');
		font-weight: 700;
		font-style: normal;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-Italic.ttf') format('truetype');
		font-weight: 400;
		font-style: italic;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-ExtraBoldItalic.ttf') format('truetype');
		font-weight: 700;
		font-style: italic;
		font-display: swap;
	}

	@font-face {
		font-family: 'Chakra Petch';
		src: url('/fonts/ChakraPetch-SemiBold.ttf') format('truetype');
		font-weight: 600;
		font-style: normal;
		font-display: swap;
	}

	:global(p) {
		font-family: 'Roboto', sans-serif;
	}

	:global(h1),
	:global(h2),
	:global(h3),
	:global(h4),
	:global(h5),
	:global(h6) {
		font-family: 'Chakra Petch', sans-serif;
    font-size: 300%;
	}
</style>

{@render children()}
