defmodule PhoenixAjaxWeb.OrderView do
  use PhoenixAjaxWeb, :view
  alias PhoenixAjaxWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("show.json", %{query_result: query_result}) do
    %{data: render_one(query_result, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{name: order.name, item: order.item}
  end

  def render("no_return.json", %{message: message}) do
    message
  end
end
