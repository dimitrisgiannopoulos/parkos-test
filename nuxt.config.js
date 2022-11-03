export default {
  publicRuntimeConfig: {
    VERSION: process.env.VERSION || 'build',
    API_URL: process.env.API_URL,
  },

  privateRuntimeConfig: {
    API_SECRET: process.env.API_SECRET || 'notdefined',
 },
}
