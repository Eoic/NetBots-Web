defmodule NetbotsWeb.Layouts do
  use NetbotsWeb, :html

  embed_templates "layouts/*"
  embed_templates "layouts/shared/*"

  def menu_items() do
    [
      %{href: "/users/log_in", title: "Login"},
      %{href: "/users/register", title: "Register"},
    ]
  end
end
