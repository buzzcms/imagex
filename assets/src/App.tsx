import React from 'react'
import { ThemeProvider } from 'theme-ui'

import { Image } from './components/Image'
import { theme } from './theme'

export default function App() {
  return (
    <ThemeProvider theme={theme}>
      <div>
        <h1>Hello from React</h1>
        <Image />
      </div>
    </ThemeProvider>
  )
}
