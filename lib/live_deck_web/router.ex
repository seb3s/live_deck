defmodule LiveDeckWeb.Router do
  use LiveDeckWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveDeckWeb do
    pipe_through :browser

    get "/style-guide", StyleGuideController, :index
    live "/", SlideView
    live "/controls", ControlView
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveDeckWeb do
  #   pipe_through :api
  # end
end
