defmodule NetbotsWeb.LandingLive do
  use NetbotsWeb, :live_view

  @slogan_switch_timeout_ms 1500

  @slogan_word_pool [
    ~c"Play by coding",
    ~c"Design algorithms",
    ~c"Solve puzzles",
    ~c"Sharpen coding skills",
    ~c"Have fun",
  ]

  def render(assigns) do
    ~H"""
    <header class="hero">
      <h1> <span class="slogan-word"><%= @slogan_word %></span></h1>
      <h2> Multiplayer battle tank programming game. </h2>
      <p> Improve your programming skills, design algorithms and compete with
        players worldwide in real-time multiplayer battles. </p>

      <div class="ctas">
        <a href="#" class="cta primary">
          <span class="material-symbols-outlined">play_circle</span>
          Play now
        </a>
        <a href="#features" class="cta secondary">
          <span class="material-symbols-outlined">lightbulb</span>
          Learn more
        </a>
      </div>
    </header>

    <main class="features" id="features">
      <section>
        <article>
          <h3>
            <span class="material-symbols-outlined">lan</span>
            Multiplayer
          </h3>
          <ul>
            <li>
              Duel in live arenas against other players from around the world.
            </li>
            <li>
              Test your code in fast-paced, real-time strategic battles.
            </li>
            <li>
              Face off against players of a similar skill level for fair and exciting matches.
            </li>
          </ul>
        </article>
            <div style="width: 100%; max-width: 500px; height: 100%; min-height: 250px; border-radius: 8px;
          background-color: rgb(100, 100, 185);"></div>
      </section>
      <section>
        <article>
          <h3>
            <span class="material-symbols-outlined">code_blocks</span>
            Real programming languages
          </h3>
          <ul>
            <li>
              Write genuine code for full control over your machine's behavior.
            </li>
            <li>
              Employ your favorite programming languages (list the ones supported by your game, e.g., Python, JavaScript,
              C++).
            </li>
            <li>
              Improve your programming skills with direct application in thrilling robot combat.
            </li>
          </ul>
        </article>
        <div style="width: 100%; max-width: 500px; height: 100%; min-height: 250px; border-radius: 8px;
          background-color: rgb(100, 100, 185);"></div>
      </section>
      <section>
        <article>
          <h3>
            <span class="material-symbols-outlined">tune</span>
            Custom game modes
          </h3>
          <ul>
            <li>
              Create thrilling scenarios with modified game rules and victory conditions.
            </li>
            <li>
              Design special maps, impose restrictions, or experiment with wild bot abilities.
            </li>
            <li>
              Host private sessions with just your friends, or open up your custom game mode to the global community.
            </li>
          </ul>
        </article>
        <div style="width: 100%; max-width: 500px; height: 100%; min-height: 250px; border-radius: 8px;
          background-color: rgb(100, 100, 185);"></div>
      </section>
      <section>
        <article>
          <h3>
            <span class="material-symbols-outlined">leaderboard</span>
            Achievements and leaderboards
          </h3>
          <ul>
            <li>
              Unlock achievements as milestones of your programming journey.
            </li>
            <li>
              Battle your way up the leaderboards and gain recognition as a coding champion.
            </li>
            <li>
              Track game statistics, unlock trophies and rewards that showcase your programming expertise and battlefield
              success.
            </li>
          </ul>
        </article>
        <div style="width: 100%; max-width: 500px; height: 100%; min-height: 250px; border-radius: 8px;
          background-color: rgb(100, 100, 185);"></div>
      </section>
    </main>
    """
  end

  def handle_params(_unsigned_params, uri, socket), do: {:noreply, assign(socket, uri: URI.parse(uri))}

  def mount(_params, _session, socket) do
    if connected?(socket) do
      # TODO: Should stop interval on unmount.
      # https://elixirforum.com/t/how-to-stop-timer/48290/3
      :timer.send_interval(@slogan_switch_timeout_ms, self(), :switch_slogan)
    end

    {
      :ok,
      assign(
        socket,
        path: "/",
        slogan_word_index: 0,
        slogan_word: Enum.at(@slogan_word_pool, 0),
        page_title: "Multiplayer battle tank programming game"
      )
    }
  end

  def handle_info(:switch_slogan, socket) do
    {
      :noreply,
      assign(
        socket,
        slogan_word_index: socket.assigns.slogan_word_index + 1,
        slogan_word:
          Enum.at(
            @slogan_word_pool,
            rem(socket.assigns.slogan_word_index + 1, length(@slogan_word_pool))
          )
      )
    }
  end
end
