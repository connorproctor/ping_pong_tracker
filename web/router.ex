defmodule PingPongTracker.Router do
  use PingPongTracker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PingPongTracker do
    pipe_through :api
  end
end
