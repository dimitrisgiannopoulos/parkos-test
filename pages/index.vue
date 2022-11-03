<template>
  <div>
    <h1>Hello Nuxters! 👋</h1>
    <p>
      This page is rendered on the <strong>{{ rendering }}</strong>
    </p>
    <p>Version: {{ $config.VERSION }}</p>
    <p>API url: {{ $.config.API_URL }}<br>API secret: {{ $config.API_SECRET }}</p>
    <p v-if="rendering === 'server'">
      First load or hard refresh is done on server side.
    </p>
    <p v-if="rendering === 'client'">
      Navigation is done on client side.
    </p>
    <ul>
      <li>Refresh the page for server side rendering.</li>
      <li>Click the links to see client side rendering.</li>
    </ul>
    <NuxtLink to="/about">About page</NuxtLink>
  </div>
</template>

<script>
export default {
  asyncData() {
    return {
      rendering: process.server ? 'server' : 'client'
    }
  }
}
</script>
