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
    [room1, room2] = insert_pair(:chat_room)

    session
    |> visit(rooms_index())
    |> assert_has(room_name(room1))
    |> assert_has(room_name(room2))
  end

  defp rooms_index, do: Routes.chat_room_path(@endpoint, :index)
  defp room_name(room), do: Query.data("role", "room", text: room.name)
end
