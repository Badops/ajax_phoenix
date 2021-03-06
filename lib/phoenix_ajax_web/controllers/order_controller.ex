defmodule PhoenixAjaxWeb.OrderController do
  use PhoenixAjaxWeb, :controller

  alias PhoenixAjax.Orders
  alias PhoenixAjax.Orders.Order

  action_fallback PhoenixAjaxWeb.FallbackController

  def index(conn, %{"query" => query}) do
    IO.inspect query, label: "query"
    query_result = Orders.query_order(query)
    case query_result do
      %Order{} -> 
        render(conn, "show.json", query_result: query_result)

      nil -> 
        render(conn, "no_return.json", message: "No resource was found")
    end
  end
  
  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Orders.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    with {:ok, %Order{} = order} <- Orders.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    with {:ok, %Order{}} <- Orders.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
