/** @jsx jsx */

import { useFormik } from 'formik'
import { useHistory, useLocation } from 'react-router-dom'
import { jsx } from 'theme-ui'

import { fetcher } from '~/utils/fetcher'

import { FormGroup } from '../FormGroup'

export function LoginForm() {
  const history = useHistory()
  const location = useLocation()
  const { from } = location.state || { from: { pathname: '/' } }
  const { values, handleBlur, handleChange, submitForm } = useFormik({
    initialValues: {
      email: 'chauhc@connected.com.vn',
      password: 'abc123',
    },
    onSubmit: async values => {
      const { access_token } = await fetcher('/auth/identity/callback', {
        method: 'post',
        body: JSON.stringify(values),
      })
      localStorage.setItem('access_token', access_token)
      history.replace(from)
    },
  })

  return (
    <form
      onSubmit={e => {
        e.preventDefault()
        submitForm()
      }}
    >
      <FormGroup label="Email">
        <input
          name="email"
          placeholder="Email"
          value={values.email}
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </FormGroup>
      <FormGroup label="Password">
        <input
          name="password"
          placeholder="Password"
          value={values.password}
          type="password"
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </FormGroup>
      <button type="submit">Submit</button>
    </form>
  )
}
