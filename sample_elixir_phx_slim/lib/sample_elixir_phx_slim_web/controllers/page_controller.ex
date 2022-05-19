defmodule SampleElixirPhxSlimWeb.PageController do
  use SampleElixirPhxSlimWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
