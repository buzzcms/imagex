defmodule ImagexWeb.Router do
  use ImagexWeb, :router

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

  # Other scopes may use custom stacks.
  scope "/api", ImagexWeb do
    pipe_through :api

    get "/:bucket/:transform/:id", ViewerController, :index
  end

  scope "/", ImagexWeb do
    pipe_through :browser

    get "/*rest", PageController, :index
  end
end
