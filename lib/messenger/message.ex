defmodule Messenger.Messages do
  @moduledoc """
    The Message context
  """
  alias Messenger.Repo
  alias Messenger.Message

  def messages(id) do
    %Message{}
    |> Repo.all()
  end
  # def get_message!(id) do
  #  Repo.get!(Message, id)
  # end
  # def get_message_by(params) do
  #  Repo.get_by(Message, params)
  # end
  # def list_Message do
  #  Repo.all(Message)
  # end

  def create_message(args, info) do
      case Message.changeset(%Message{}, args) do
        {:ok, message} ->
          Repo.insert(message)
        {:error, changeset} ->
          Message.log_errors(changeset)
      end
  end

end
