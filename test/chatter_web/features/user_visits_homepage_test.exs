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
end
