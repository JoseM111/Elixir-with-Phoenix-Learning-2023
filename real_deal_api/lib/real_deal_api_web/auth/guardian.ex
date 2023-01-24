# package:auth guardian.ex

defmodule RealDealApiWeb.Auth.Guardian do
  use Guardian, otp_app: :real_deal_api
  # This is our context api that queries our accounts database
  alias RealDealApi.Accounts
  # ===========================================

  def subject_for_token(token, claims) do
    case token do
      %{ id: id } -> sub = to_string(id)
                     { :ok, sub }
      _ -> { :error, :no_id_provided }
    end
  end
  
#  def subject_for_token(%{ id: id }, _claims) do
#    sub = to_string(id)
#    { :ok, sub }
#  end
#
#  def subject_for_token(_, _) do
#    { :error, :no_id_provided }
#  end
  
  
  
  def resource_from_claims(%{ "sub" => id }) do
    case Accounts.get_account!(id) do
      nil -> { :error, :not_found }
      resource -> { :ok, resource }
    end
  end
  
  def resource_from_claims(_claims) do
    { :error, :no_id_provided }
  end
  # ===========================================
end