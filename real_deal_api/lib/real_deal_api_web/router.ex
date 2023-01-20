defmodule RealDealApiWeb.Router do
  use RealDealApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RealDealApiWeb do
    # Defines a list of plugs (and pipelines) to
    # send the connection through. Like for example
    # the line of code: plug :accepts, ["json"]
    pipe_through :api
    get "/", DefaultController, :index
    
  end
end
