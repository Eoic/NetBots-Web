defmodule NetbotsWeb.DocsController do
  use NetbotsWeb, :controller

  def index(conn, _params) do
    render(conn, :docs, layout: false)
  end
end
