/** @jsx jsx */

import { DialogContent, DialogOverlay } from '@reach/dialog'
import { jsx } from 'theme-ui'

import { Bucket, EditBucketInput } from '~/types'

import { BucketEditForm } from './BucketEditForm'

export function EditBucketDialog({
  entity,
  onSubmit,
  onClose,
}: {
  entity: Bucket | null
  onSubmit: (id: number, data: EditBucketInput) => void
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
      isOpen={!!entity}
      onDismiss={onClose}
    >
      <DialogContent aria-label="Edit Dialog">
        {entity && (
          <BucketEditForm
            initialValues={entity}
            onSubmit={values => onSubmit(entity.id, values)}
          />
        )}
      </DialogContent>
    </DialogOverlay>
  )
}
