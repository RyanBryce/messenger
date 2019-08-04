defmodule MessengerWeb.Router do
  use MessengerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    # plug GetawaysWeb.Plugs.SetCurrentUser
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: Messenger.Schema.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Messenger.Schema.Schema,
      # socket: MessengerWeb.UserSocket,
      interface: :simple
  end

  # Other scopes may use custom stacks.
  # scope "/api", MessengerWeb do
  #   pipe_through :api
  # end
end
