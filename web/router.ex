defmodule BattleSnakeServer.Router do
  use BattleSnakeServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BattleSnakeServer do
    pipe_through :browser # Use the default browser stack

    resources "/", GameController

    resources "/play", PlayController, only: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", BattleSnakeServer do
  #   pipe_through :api
  # end
end
