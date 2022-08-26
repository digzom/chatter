defmodule Chatter.Chat do
  alias Chatter.{Repo, Chat.Room}

  def all_rooms do
    Repo.all(Room)
  end
end
