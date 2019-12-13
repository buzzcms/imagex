import url from 'url'

import { endpoint } from '~/config'

export const fetcher = async (
  pathname: string,
  options?: RequestInit & { body: any },
) => {
  const token = window.localStorage.getItem('access_token')
  const auth = token && { Authorization: `Bearer ${token}` }
  try {
    const r = await fetch(url.resolve(endpoint, pathname), {
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
        ...auth,
      },
      ...options,
    })
    console.log('xxx')
    return r.json()
  } catch (err) {
    console.log(err)
  }
}
