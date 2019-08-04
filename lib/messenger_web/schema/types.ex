defmodule Messenger.Schema.Types do
  use Absinthe.Schema.Notation
  @moduledoc """
    all Absinthe schema types
  """

  object :user do
    field :name, :string
    field :username, :string
    field :message, list_of(:message)
  end

  object :message do
    field :title, :string
    field :body, :string
    field :author, :user
  end
end
