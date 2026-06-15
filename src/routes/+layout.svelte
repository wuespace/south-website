<script lang="ts">
  import logo from "$lib/assets/south-logo.svg";
	let { children } = $props();
</script>

<nav>
  <a class="horizontal-flex" href="/">
    <img src={logo} style:width=4rem alt="logo">
    <h1>S²OUTH</h1>
  </a>
  <div class="horizontal-flex links">
    <a href="/supporters">Supporters</a>
    <a href="/south-cube">South-Cube</a>
    <a href="/north">N₂ORTH</a>
  </div>
</nav>

<style>

  :global(html),
  :global(body) {
    background-image: linear-gradient(to bottom right, #292929, #0D2D59);
    background-attachment: fixed;
  }
  h1 {
    font-size: 180%;
  }
  nav {
    height: 4%;
    padding: 0 4rem;
    display: flex;
    align-items: center;
  }
  .horizontal-flex {
    display: flex;
    gap: 1.5rem;
  }
  .links {
    margin-left: auto;
  }
  a {
    color: white;
    text-decoration: none;
    background-image: linear-gradient(currentColor, currentColor);
    background-position: 0 100%;
    background-size: 0 1px;
    background-repeat: no-repeat;
    transition: background-size 0.25s ease;
  }
  a:hover, a:focus-visible {
    background-size: 100% 1px;
  }
	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-Regular.woff2') format('truetype');
		font-weight: 400;
		font-style: normal;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-ExtraBold.woff2') format('truetype');
		font-weight: 700;
		font-style: normal;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-Italic.woff2') format('truetype');
		font-weight: 400;
		font-style: italic;
		font-display: swap;
	}

	@font-face {
		font-family: 'Roboto';
		src: url('/fonts/Roboto-ExtraBoldItalic.woff2') format('truetype');
		font-weight: 700;
		font-style: italic;
		font-display: swap;
	}

	@font-face {
		font-family: 'Chakra Petch';
		src: url('/fonts/ChakraPetch-SemiBold.woff2') format('truetype');
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
    font-size: 200%;
	}
</style>

{@render children()}
