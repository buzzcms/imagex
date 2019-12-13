/** @jsx jsx */

import { useFormik } from 'formik'
import { ReactNode, useState } from 'react'
import useSWR from 'swr'
import { jsx } from 'theme-ui'

import { fetcher } from '~/utils/fetcher'

export interface Bucket {
  id: number
  name: string
  secret: string
  account_id: number
}

export interface EditBucketInput {
  id?: number
  name: string
  secret: string
  account_id: number
}

function FormGroup({
  label,
  helpText,
  children,
}: {
  label: string
  helpText?: string
  children: ReactNode
}) {
  return (
    <div>
      <label>{label}</label>
      {children}
      {helpText && <p>{helpText}</p>}
    </div>
  )
}

function BucketEditForm({
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
      <button type="submit">Edit</button>
    </form>
  )
}

export default function BucketsPage() {
  const { data, isValidating, revalidate } = useSWR<{ entities: Bucket[] }>(
    '/api/buckets',
    fetcher,
  )
  const [selected, setSelected] = useState<Bucket | null>(null)

  const entities = data?.entities || []
  if (isValidating) {
    return <div>Loading...</div>
  }
  return (
    <div>
      {entities.map(item => (
        <div key={item.id}>
          <div>
            {item.name} - {item.secret}
          </div>
          <button onClick={() => setSelected(item)}>select</button>
        </div>
      ))}
      <BucketEditForm
        initialValues={{ name: 'media.acafe.vn', secret: 'xxx', account_id: 1 }}
        onSubmit={async values => {
          await fetcher('/api/buckets', {
            method: 'post',
            body: JSON.stringify(values),
          })
          revalidate()
        }}
      />
      {selected && (
        <BucketEditForm
          initialValues={selected}
          onSubmit={async data => {
            await fetcher(`/api/buckets/${selected.id}`, {
              method: 'put',
              body: JSON.stringify({ data }),
            })
            revalidate()
          }}
        />
      )}
    </div>
  )
}
