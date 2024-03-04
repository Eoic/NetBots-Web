defmodule NavigationComponent do
  use NetbotsWeb, :live_component
  use Phoenix.LiveComponent

  def menu_items() do
    [
      %{href: "/users/log_in", title: "Login"},
      %{href: "/users/register", title: "Register"},
    ]
  end

  def render(assigns) do
    ~H"""
    <nav class="menu">
        <input type="checkbox" id="menu-toggle">

        <label for="menu-toggle">
            <span menu-action="open" class="material-symbols-outlined">menu</span>
            <span menu-action="close" class="material-symbols-outlined">close</span>
        </label>

        <ul>
            <li class={["brand"] ++ [(if @path == "/", do: "active", else: "")]}>
                <.link navigate={~p"/"}></.link>
            </li>

            <%= for {item, index} <- Enum.with_index(menu_items()) do %>
                <li class={if @path == Map.get(item, :href), do: "active", else: ""}>
                    <.link navigate={Map.get(item, :href)}>
                        <%= Map.get(item, :title) %>
                    </.link>
                </li>
                <%= if index < (length menu_items()) - 1 do %>
                    <li class="separator">/</li>
                <% end %>
            <% end %>
        </ul>
    </nav>
    """
  end
end
