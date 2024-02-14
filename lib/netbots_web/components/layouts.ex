defmodule NetbotsWeb.Layouts do
  use NetbotsWeb, :html

  embed_templates "layouts/*"
  embed_templates "layouts/shared/*"

  def menu_items() do
    [
      "Features",
      "Documentation",
      "Login",
      "Register"
    ]
  end
end
