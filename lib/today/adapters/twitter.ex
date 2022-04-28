defmodule Today.Adapters.Twitter do
  @moduledoc """
  Adapter for Twitter API.
  """

  import Application, only: [fetch_env!: 2]

  @behaviour Today.Ports.Twitter

  @impl true
  def get_user_info_by_handle(handle) do
    path = "users/by/username/#{handle}"

    case Tesla.get(client(), path, query: ["user.fields": "created_at"]) do
      {:ok, %Tesla.Env{body: %{"data" => body}, status: 200}} -> {:ok, body}
      error -> handle_error(error)
    end
  end

  defp handle_error({:ok, %Tesla.Env{status: 401}}), do: {:error, :unauthorized}

  defp handle_error(
         {:ok,
          %Tesla.Env{
            body: %{"errors" => [%{"title" => "Not Found Error"}]},
            status: 200
          }}
       ),
       do: {:error, :not_found}

  defp handle_error(_), do: {:error, :unexpected}

  defp client do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.twitter.com/2/"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BearerAuth, token: fetch_env!(:today, :bearer_token)}
    ]

    Tesla.client(middleware, fetch_env!(:tesla, :adapter))
  end
end
