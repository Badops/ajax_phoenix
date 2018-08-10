defmodule PhoenixAjax.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :item, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:name, :item])
    |> validate_required([:name, :item])
  end
end
