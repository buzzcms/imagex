import React from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import { ThemeProvider } from 'theme-ui'

import { Layout } from './components/Layout'
import BucketsPage from './pages/Buckets'
import ImagesPage from './pages/Images'
import LoginPage from './pages/Login'
import NotFoundPage from './pages/NotFound'
import { theme } from './theme'

export default function App() {
  return (
    <ThemeProvider theme={theme}>
      <Router>
        <Layout>
          <Switch>
            <Route path="/login" exact>
              <LoginPage />
            </Route>
            <Route path="/images" exact>
              <ImagesPage />
            </Route>
            <Route path="/buckets" exact>
              <BucketsPage />
            </Route>
            <Route>
              <NotFoundPage />
            </Route>
          </Switch>
        </Layout>
      </Router>
    </ThemeProvider>
  )
}
