defmodule Messenger.Resolver.Message do
  alias Messenger.Message

  def all_messages(_parent, _args, _resolution) do
    {:ok, Message.message()}
  end
  def create_message(_parent, args, info) do
    IO.inspect(info)
    # IO.inspect(args)
    {:ok, Message.create_message(args, info)}
  end
  # def list_posts(_parent, _args, _resolution) do
  #   {:ok, Accounts.list_users()}
  # end
  # def list_posts(_parent, _args, _resolution) do
  #   {:ok, Accounts.list_users()}
  # end
end
