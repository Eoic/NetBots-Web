defmodule NetbotsWeb.Layouts do
  use NetbotsWeb, :html

  embed_templates "layouts/*"
  embed_templates "layouts/shared/*"

  def menu_items() do
    [
      %{href: "#features", title: "Features"},
      %{href: "/docs", title: "Documentation"},
      %{href: "/login", title: "Login"},
      %{href: "/register", title: "Register"},
    ]
  end
end
