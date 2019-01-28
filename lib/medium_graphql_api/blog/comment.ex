defmodule MediumGraphqlApi.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

#mix phx.gen.context Blog Comment comments content:text user_id:references:user post_id:references:post
  schema "comments" do
    field :content, :string
    field :user_id, :id
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
