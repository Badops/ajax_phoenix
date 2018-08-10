# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixAjax.Repo.insert!(%PhoenixAjax.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PhoenixAjax.Orders

orders1 = %{name: "Blake", item: "Samsung S8"}
orders2 = %{name: "Don", item: "Rolex wrist watch"}

Orders.create_order(orders1)
Orders.create_order(orders2)


