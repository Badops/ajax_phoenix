defmodule PhoenixAjaxWeb.PageController do
  use PhoenixAjaxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
