defmodule MediumGraphqlApi.Accounts.Session do
  alias MediumGraphqlApi.Accounts.User
  alias MediumGraphqlApi.Repo

  def authentication(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> 
        IO.inspect "oooooooi"
        Comeonin.Argon2.dummy_checkpw()
      _ -> 
        IO.inspect args.password
        IO.puts "=========="
        IO.inspect user
        Comeonin.Argon2.checkpw(args.password, user.password)
    end
  end
end
