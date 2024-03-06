defmodule NetbotsWeb.UserLoginLive do
  use NetbotsWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="container">
      <%!-- <div>
        Sign in to account
        <div>
          Don't have an account?
          <.link navigate={~p"/users/register"}>
            Sign up
          </.link>
          for an account now.
        </div>
      </div> --%>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} class="form" phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/users/reset_password"}x>
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Signing in...">
            Sign in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def handle_params(_unsigned_params, uri, socket),
    do: {:noreply, assign(socket, uri: URI.parse(uri))}

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form, page_title: "Login"), temporary_assigns: [form: form]}
  end
end
