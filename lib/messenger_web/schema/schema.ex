defmodule Messenger.Schema.Schema do

  @moduledoc """
    types and schema for Messenger.Scema.Schema
  """
  use Absinthe.Schema

  import_types Messenger.Schema.Types

  alias Messenger.Resolver.{
    Message
  }
  alias Messenger.Accounts

  query do
    @desc "get all users "
    field :users, list_of(:user) do
    resolve fn _, _, _ ->
      {:ok, Accounts.list_users()}
    end
    end

    @desc "get a one user by id "
    field :user, :user do
      arg :id, :integer
      resolve fn _, %{id: id}, _ ->
        {:ok, Accounts.get_user(id)}
      end
    end

    # @desc "get all users "
    # field :user_by, :user do
    #   resolve fn _, %{}, _ ->
    #     {:ok, Acounts}
    #   end
    # end


    @desc "get all messages "
    field :message, list_of(:message) do
      resolve &Message.all_messages/3
    end

    # @desc "get a one user by id "
    # field :message, :message do
    #   arg :id, :integer
    #   resolve fn _, %{id: id}, _ ->
    #     {:ok, Accounts.get_user(id)}
    #   end
    # end

    # @desc "get all message "
    # field :user_by, :message do
    #   resolve fn _, %{}, _ ->
    #     {:ok, Acounts}
    #   end
    # end

  end

  mutation do

    field :create_message, :message do
      arg :title, :string
      arg :body, :string
      arg :user_id, :id

      resolve &Message.create_message/3
    end

  end

end
