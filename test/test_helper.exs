ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PingPongTracker.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PingPongTracker.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PingPongTracker.Repo)

