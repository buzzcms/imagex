/** @jsx jsx */

import { useFormik } from 'formik'
import { jsx } from 'theme-ui'

import { fetcher } from '~/utils/fetcher'

import { FormGroup } from '../FormGroup'

export function LoginForm() {
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
