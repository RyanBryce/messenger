defmodule Messenger.Repo.Migrations.Post do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :title, :string
      add :body, :string, null: false
      add :user_id, references(:users), on_delete: :delete_all

      timestamps()
    end

  end
end
