/** @jsx jsx */

import { jsx } from 'theme-ui'

import { Bucket } from '~/types'

export function BucketTable({
  entities,
  onEdit,
  onRemove,
}: {
  entities: Bucket[]
  onEdit?: (entity: Bucket) => void
  onRemove?: (entity: Bucket) => void
}) {
  const hasAction = onEdit || onRemove
  return (
    <table>
      <thead>
        <tr>
          {hasAction && <th>Actions</th>}
          <th>Id</th>
          <th>Name</th>
          <th>Secret</th>
        </tr>
      </thead>
      <tbody>
        {entities.map(item => (
          <tr key={item.id}>
            <td>
              {onEdit && <button onClick={() => onEdit(item)}>Edit</button>}
              {onRemove && (
                <button onClick={() => onRemove(item)}>Remove</button>
              )}
            </td>
            <td>{item.id}</td>
            <td>{item.name}</td>
            <td>{item.secret}</td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
