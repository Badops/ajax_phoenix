defmodule PhoenixAjaxWeb.Router do
  use PhoenixAjaxWeb, :router

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

  scope "/", PhoenixAjaxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/orders", OrderController, except: [:delete, :edit, :update, :new]
    get "/orders/:query", OrderController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixAjaxWeb do
  #   pipe_through :api
  # end
end
