defmodule Chatter.Factory do
  # it defines Chatter.Factory.insert/1 and insert/2
  use ExMachina.Ecto, repo: Chatter.Repo

  def chat_room_factory do
    %Chatter.Chat.Room{
      # using the name key in our schema to generate
      # auto-incrementing values, so that values
      # aren't the same across tests.
      name: sequence(:name, &"chat room #{&1}")
    }
  end
end
