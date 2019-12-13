import decode from 'jwt-decode'
import React, { ReactNode } from 'react'
import {
  BrowserRouter,
  Redirect,
  Route,
  Switch,
  useHistory,
} from 'react-router-dom'
import { ThemeProvider } from 'theme-ui'

import { Layout } from './components/Layout'
import BucketsPage from './pages/Buckets'
import ImagesPage from './pages/Images'
import LoginPage from './pages/Login'
import NotFoundPage from './pages/NotFound'
import { theme } from './theme'

export function getAuth() {
  const token = localStorage.getItem('access_token')
  if (!token) {
    return null
  }
  const jwt = decode<{ iat: number; exp: number }>(token)
  return jwt.exp * 1000 > Date.now()
}

function signout() {
  localStorage.removeItem('access_token')
}

function AuthButton() {
  const history = useHistory()
  const isLoggedIn = getAuth()
  if (!isLoggedIn) {
    return <p>You are not logged in.</p>
  }

  return (
    <p>
      Welcome!{' '}
      <button
        onClick={() => {
          signout()
          history.push('/')
        }}
      >
        Sign out
      </button>
    </p>
  )
}

function PublicPage() {
  return <div>Welcome</div>
}

function PrivateRoute({ children, ...rest }: { children: ReactNode }) {
  return (
    <Route
      {...rest}
      render={({ location }) => {
        const isLoggedIn = getAuth()
        if (!isLoggedIn) {
          return (
            <Redirect
              to={{
                pathname: '/login',
                state: { from: location },
              }}
            />
          )
        }
        return children
      }}
    />
  )
}

export default function App() {
  return (
    <ThemeProvider theme={theme}>
      <BrowserRouter>
        <Layout>
          <AuthButton />
          <Switch>
            <Route path="/" exact>
              <PublicPage />
            </Route>
            <Route path="/login" exact>
              <LoginPage />
            </Route>
            <PrivateRoute>
              <Route path="/images" exact>
                <ImagesPage />
              </Route>
              <Route path="/buckets" exact>
                <BucketsPage />
              </Route>
            </PrivateRoute>
            <Route>
              <NotFoundPage />
            </Route>
          </Switch>
        </Layout>
      </BrowserRouter>
    </ThemeProvider>
  )
}
