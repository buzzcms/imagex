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

  pipeline :auth do
    plug Imagex.Auth.Pipeline
  end

  scope "/auth", ImagexWeb do
    pipe_through [:api, :auth]
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
    post("/:provider/callback", AuthController, :callback)

    post("/register", AuthController, :register)
    post("/logout", AuthController, :delete)
  end

  # Other scopes may use custom stacks.
  scope "/api", ImagexWeb do
    pipe_through :api

    get "/buckets", BucketController, :index
    post "/buckets", BucketController, :create
    put "/buckets/:id", BucketController, :update
  end

  scope "/", ImagexWeb do
    pipe_through :browser

    get "/:bucket/:transform/:id", ViewerController, :index
    get "/*rest", PageController, :index
  end
end
