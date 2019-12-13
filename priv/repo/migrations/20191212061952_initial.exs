defmodule Imagex.Repo.Migrations.Initial do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string, null: false
      add :password, :string, null: false
      add :created_at, :utc_datetime, null: false, default: fragment("now()")
      add :modified_at, :utc_datetime, null: false, default: fragment("now()")
    end

    create unique_index(:user, :email)

    create table(:bucket) do
      add :name, :string, null: false
      add :secret, :text, null: false
      add :user_id, references(:user), null: false
      add :created_at, :utc_datetime, null: false, default: fragment("now()")
      add :modified_at, :utc_datetime, null: false, default: fragment("now()")
    end

    create unique_index(:bucket, :name)

    create table(:image, primary_key: false) do
      add :id, :string, primary_key: true
      add :remote_url, :string, length: 2048
      add :name, :string, null: false, length: 2048
      add :ext, :string
      add :mime, :string
      add :caption, :string
      add :width, :decimal, precision: 8, scale: 2
      add :height, :decimal, precision: 8, scale: 2
      add :size, :decimal, precision: 14, scale: 2

      add :status, :string,
        null: false,
        default: "ready",
        check: "(status IN ('ready', 'download_failed', 'downloaded', 'uploaded'))"

      add :bucket_id, references(:bucket), null: false
      add :user_id, references(:user), null: false
      add :created_at, :utc_datetime, null: false, default: fragment("now()")
      add :modified_at, :utc_datetime, null: false, default: fragment("now()")
    end

    create unique_index(:image, :remote_url)
  end
end
