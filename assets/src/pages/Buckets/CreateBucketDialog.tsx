/** @jsx jsx */

import { DialogContent, DialogOverlay } from '@reach/dialog'
import { jsx } from 'theme-ui'

import { EditBucketInput } from '~/types'

import { BucketEditForm } from './BucketEditForm'

export function CreateBucketDialog({
  isOpen,
  onSubmit,
  onClose,
}: {
  isOpen: boolean
  onSubmit: (data: EditBucketInput) => void
  onClose?: () => void
}) {
  return (
    <DialogOverlay
      sx={{
        '[data-reach-dialog-overlay]': {},
        '[data-reach-dialog-content]': {
          width: '60vw',
          borderRadius: 8,
        },
      }}
      isOpen={isOpen}
      onDismiss={onClose}
    >
      <DialogContent aria-label="Edit Dialog">
        <BucketEditForm
          initialValues={{
            name: '',
            secret: '',
            user_id: 1,
          }}
          onSubmit={values => onSubmit(values)}
        />
      </DialogContent>
    </DialogOverlay>
  )
}
