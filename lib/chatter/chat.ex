defmodule Chatter.Chat do
  alias Chatter.{Repo, Chat.Room}

  def all_rooms do
    Repo.all(Room)
  end

  def new_chat_room do
    %Room{}
    |> Room.changeset(%{})
  end
end
