# account.ex

defmodule RealDealApi.Accounts.Account do
  @moduledoc """
  Accounts schema
  """
  
  use Ecto.Schema
  import Ecto.Changeset
#  alias RealDealApi.Users.User
  
  @primary_key { :id, :binary_id, autogenerate: true }
  @foreign_key_type :binary_id
  schema "accounts" do
    field :email, :string
    field :hash_password, :string
    # TODO: changed
    has_one :user, RealDealApi.Users.User
    
    timestamps()
  end
  
  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [ :email, :hash_password ])
    |> validate_required([ :email, :hash_password ])
      # validating our email input format with regex.
      # The code is not allowing spaces and it has to
      # have an @ symbol
    |> validate_format(
         :email,
         ~r/^[^\s]+@[^\s]+$/,
         message: "must have the @ sign and no spaces"
       )
      # the length of the email
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
  end
end
