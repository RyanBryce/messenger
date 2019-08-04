defmodule Messenger.Accounts do
  @moduledoc """
    The Accounts context
  """
  alias Messenger.Repo
  alias Messenger.Accounts.User

  def get_user(id) do
    %User{}
    |> Repo.get(id)
  end
  def get_user!(id) do
    %User{}
    |> Repo.get!( id)
  end
  def get_user_by(params) do
    %User{}
    |> Repo.get_by(params)
  end
  def list_users do
    %User{}
    |> Repo.all
  end

  def create_user(attrs \\ %{}) do
      case User.changeset(%User{}, attrs) do
        {:ok, user} ->
          Repo.insert(user)
        {:error, changeset} ->
          IO.inspect(User.log_errors(changeset))
      end
  end

end
