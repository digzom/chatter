defmodule ChatterWeb.Features.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a new chat room successfully", %{session: session} do
    session
    |> visit(Routes.chat_room_path(@endpoint, :index))
    |> click(Query.link("New chat room"))
    # the "whith" option refers to a value
    |> fill_in(Query.text_field("Name"), with: "Elixir")
    |> click(Query.button("Submit"))
    |> assert_has(Query.data("role", "room-title", text: "Elixir"))
  end
end
