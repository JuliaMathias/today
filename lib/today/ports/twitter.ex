defmodule Today.Ports.Twitter do
  @moduledoc """
  Behaviour for Twitter Api Client
  """

  @callback get_user_info_by_handle(handle :: String.t()) :: {:ok, map} | {:error, reason :: atom}
end
