export interface Bucket {
  id: number
  name: string
  secret: string
  account_id: number
}

export interface EditBucketInput {
  name: string
  secret: string
  account_id: number
}
