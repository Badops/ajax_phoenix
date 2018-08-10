defmodule PhoenixAjax.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    execute "CREATE extension if not exists citext;"
    
    create table(:orders) do
      add :name, :citext, null: false
      add :item, :citext, null: false 

      timestamps()
    end
    create index(:orders, [:name])
  end
end
