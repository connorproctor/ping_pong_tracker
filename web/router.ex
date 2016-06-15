defmodule PingPongTracker.Router do
  use PingPongTracker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/slack", PingPongTracker do
    pipe_through :api

    get "/", SlackIntegrationController, :index 

    post "/", SlackIntegrationController, :receive
  end
end
