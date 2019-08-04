defmodule Messenger.Accounts.User do
  use Ecto.Schema

  alias Messenger.Messages

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string

    has_many :messages, Messages, on_delete: :delete_all

    timestamps()
  end

  def changeset user, attrs do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  def log_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
