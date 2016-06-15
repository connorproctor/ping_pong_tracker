defmodule PingPongTracker.SlackIntegrationController do
  use PingPongTracker.Web, :controller

  def index(conn, params) do
  	receive(conn, params)
  end

  def receive(conn, params) do
    my_text = case command(params) do
  		"pong" ->
        log "Game started"
      "in" ->
        log "Joined"
      "quit" ->
        log "Game quit"
      "start" ->
        log "Game started"
      "rank" ->
        log "User rank"
      "rankings" ->
        log "Everyone's rankings"
      "help" ->
        log "Help message"
      _ -> 
        log "Doh!"
      end
    respond conn, my_text
  end


  defp respond(conn, text) do
    json conn, %{text: text}
  end

  defp command(params) do
  	String.replace(params["trigger_word"], ".", "")
  end

  defp log(text) do
    IO.puts text
    text
  end
end
