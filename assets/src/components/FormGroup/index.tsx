/** @jsx jsx */

import { ReactNode } from 'react'
import { jsx } from 'theme-ui'

export function FormGroup({
  label,
  helpText,
  children,
}: {
  label: string
  helpText?: string
  children: ReactNode
}) {
  return (
    <div sx={{ marginBottom: 2 }}>
      <label sx={{ display: 'block' }}>{label}</label>
      <div>{children}</div>
      {helpText && <div>{helpText}</div>}
    </div>
  )
}
