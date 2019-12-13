/** @jsx jsx */

import { useFormik } from 'formik'
import { jsx } from 'theme-ui'

import { FormGroup } from '~/components/FormGroup'
import { EditBucketInput } from '~/types'
export function BucketEditForm({
  initialValues,
  onSubmit,
}: {
  initialValues: EditBucketInput
  onSubmit: (bucket: EditBucketInput) => void
}) {
  const { values, handleBlur, handleChange, submitForm } = useFormik({
    initialValues,
    onSubmit,
  })
  return (
    <form
      onSubmit={e => {
        e.preventDefault()
        submitForm()
      }}
    >
      <div>
        <FormGroup label="Name">
          <input
            name="name"
            value={values.name}
            onChange={handleChange}
            onBlur={handleBlur}
          />
        </FormGroup>
        <FormGroup label="Secret">
          <input
            name="secret"
            value={values.secret}
            onChange={handleChange}
            onBlur={handleBlur}
          />
        </FormGroup>
      </div>
      <div>
        <button type="submit">Edit</button>
      </div>
    </form>
  )
}
