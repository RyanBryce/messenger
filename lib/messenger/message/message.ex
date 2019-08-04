defmodule Messenger.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :title, :string
    field :body, :string

    belongs_to :user, Message

    timestamps()
  end

  def changeset user, attrs do
    user
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> cast_assoc(:user)
    |> validate_length(:body, min: 1)
  end

  def log_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
