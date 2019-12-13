/** @jsx jsx */

import { useFormik } from 'formik'
import { jsx } from 'theme-ui'

import { fetcher } from '~/utils/fetcher'

export function RegisterForm() {
  const { values, handleBlur, handleChange, submitForm } = useFormik({
    initialValues: {
      email: 'chauhc@connected.com.vn',
      name: 'Chau Hua',
      password: 'abc123',
      password_confirm: 'abc123',
    },
    onSubmit: async values => {
      const { access_token } = await fetcher('/auth/register', {
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
      <div>
        <input
          name="email"
          placeholder="Email"
          value={values.email}
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </div>
      <div>
        <input
          name="name"
          placeholder="Name"
          value={values.name}
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </div>
      <div>
        <input
          name="password"
          placeholder="Password"
          value={values.password}
          type="password"
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </div>
      <div>
        <input
          name="password_confirm"
          placeholder="Confirm"
          value={values.password_confirm}
          type="password"
          onChange={handleChange}
          onBlur={handleBlur}
        />
      </div>
      <button type="submit">Submit</button>
    </form>
  )
}
