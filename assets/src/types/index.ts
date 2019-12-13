export interface Bucket {
  id: number
  name: string
  secret: string
  user_id: number
}

export interface EditBucketInput {
  name: string
  secret: string
  user_id: number
}
