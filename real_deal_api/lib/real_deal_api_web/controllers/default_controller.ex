# default_controller.ex

defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller
  # ======================================

  def index(conn, _params) do
    # text: Sends text response
  text conn, "The Real Deal API is Live - #{Mix.env()}"
  end
  # ======================================
  
end