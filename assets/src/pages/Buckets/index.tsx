/** @jsx jsx */

import { useState } from 'react'
import useSWR from 'swr'
import { jsx } from 'theme-ui'

import { Bucket, EditBucketInput } from '~/types'
import { fetcher } from '~/utils/fetcher'

import { BucketTable } from './BucketTable'
import { CreateBucketDialog } from './CreateBucketDialog'
import { EditBucketDialog } from './EditBucketDialog'

class BucketService {
  get endpoint() {
    return '/api/buckets'
  }

  async create(data: EditBucketInput) {
    await fetcher('/api/buckets', {
      method: 'post',
      body: JSON.stringify(data),
    })
  }
  async edit(id: number, data: EditBucketInput) {
    await fetcher(`/api/buckets/${id}`, {
      method: 'put',
      body: JSON.stringify({ data }),
    })
  }
}

const service = new BucketService()

export default function BucketsPage() {
  const { data, revalidate } = useSWR<{ entities: Bucket[] }>(
    service.endpoint,
    fetcher,
  )

  const [isCreate, setIsCreate] = useState(false)
  const [entityToEdit, setEntityToEdit] = useState<Bucket | null>(null)
  const entities = data?.entities || []

  return (
    <div>
      <button onClick={() => setIsCreate(true)}>Create Bucket</button>
      <BucketTable
        entities={entities}
        onEdit={entity => setEntityToEdit(entity)}
      />
      <CreateBucketDialog
        isOpen={isCreate}
        onClose={() => setIsCreate(false)}
        onSubmit={async data => {
          await service.create(data)
          revalidate()
        }}
      />
      <EditBucketDialog
        entity={entityToEdit}
        onClose={() => setEntityToEdit(null)}
        onSubmit={async (id, data) => {
          await service.edit(id, data)
          revalidate()
        }}
      />
    </div>
  )
}
