defmodule MediumGraphqlApiWeb.Resolver.UserResolver do
  alias MediumGraphqlApi.Accounts

  def users(_, _, %{context: context}) do
    IO.puts "================"
    IO.inspect context
    {:ok, Accounts.list_users()}
  end 

  def register_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
  
end
