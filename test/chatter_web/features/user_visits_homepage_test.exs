defmodule ChatterWeb.Features.UserVisitsHomepageTest do
  use ChatterWeb.FeatureCase, async: true

  # this session map is provided by our feature case
  test "user can visit homepage", %{session: session} do
    session
    # this two functions comes from Wallaby.Browser
    |> visit("/")
    # Query was aliased in Wallaby.DSL in feature_case.ex
    |> assert_has(Query.css(".title", text: "Welcome to Chatter!"))
  end

  test "user visits rooms page to see a list of rooms", %{session: session} do
    # maps to chat_room_factory function
    room = insert(:chat_room)

    session
    |> visit(Routes.chat_room_path(@endpoint, :index))
    |> assert_has(Query.css(".room", text: room.name))
  end
end
