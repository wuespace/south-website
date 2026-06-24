<script lang="ts">
  import "../app.css";
  import { MediaQuery } from "svelte/reactivity";
  import DesktopNavBar from "./desktop_nav_bar.svelte";
  import MobileNavBar from "./mobile_nav_bar.svelte";
  import SubpageLinks from "./subpage_links.svelte";
  import Footer from "./footer.svelte";
  
  const wide = new MediaQuery('min-aspect-ratio: 1/1');
  
  let { children } = $props();
</script>

{#if wide.current}
  <DesktopNavBar>
      <SubpageLinks />
  </DesktopNavBar>
{:else}
  <MobileNavBar>
      <SubpageLinks />
  </MobileNavBar>
{/if}

<div class="main">
  {@render children()}
</div>

<Footer />

<style>
  /* Base styles, design tokens and shared utilities live in src/app.css. */
  .main {
    padding: 1.5rem 0;
  }
</style>
