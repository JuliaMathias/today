defmodule Today.Repo.Migrations.CreateTwitterAccount do
  @moduledoc """
  Creates a twitter account table and defines an unique constraint on handle.
  """
  use Ecto.Migration

  def change do
    create table(:twitter_accounts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :handle, :string
      add :account_created_at, :naive_datetime
      add :twitter_id, :string

      timestamps()
    end

    create unique_index(:twitter_accounts, [:handle])
  end
end
