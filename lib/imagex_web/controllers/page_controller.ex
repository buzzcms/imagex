defmodule ImagexWeb.PageController do
  use ImagexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
