export const isDev = process.env.NODE_ENV !== 'production'
export const endpoint = isDev ? 'http://localhost:4000/' : '/'
