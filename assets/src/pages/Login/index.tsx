/** @jsx jsx */

import { jsx } from 'theme-ui'

import { LoginForm } from '~/components/LoginForm'
import { RegisterForm } from '~/components/RegisterForm'

export default function LoginPage() {
  return (
    <div>
      <h1>Login goes here</h1>
      <div sx={{ display: 'flex' }}>
        <div sx={{ width: '50%' }}>
          <RegisterForm />
        </div>
        <div sx={{ width: '50%' }}>
          <LoginForm />
        </div>
      </div>
    </div>
  )
}
