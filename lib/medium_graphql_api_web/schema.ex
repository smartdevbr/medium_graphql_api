defmodule MediumGraphqlApiWeb.Schema do
  use Absinthe.Schema
  alias MediumGraphqlApiWeb.Resolver
  alias MediumGraphqlApiWeb.Schema.MiddleWare
  # import types
  import_types(MediumGraphqlApiWeb.Schema.Types)

  query do
    @desc "Get a list of all users"

    field :users, list_of(:user_type) do
      # resolver
      middleware(MiddleWare.Authorize, :any )
      resolve(&Resolver.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolver.UserResolver.register_user/3)
    end

    @desc "Login a user and return a jwt token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolver.SessionResolver.login_user/3)
    end

    @desc "Create a Post" 
    field :create_post, type: :post_type do
      arg(:input, non_null(:post_input_type))
      middleware(MiddleWare.Authorize, :any )
      resolve(&Resolver.PostResolver.create_post/3)
    end
  end

  # subscription do
  # end
end
