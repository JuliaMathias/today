ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Today.Repo, :manual)

Mox.defmock(TeslaMock, for: Tesla.Adapter)
