defmodule NetbotsWeb.PageController do
  use NetbotsWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
