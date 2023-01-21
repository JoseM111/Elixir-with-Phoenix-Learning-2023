defmodule RealDealApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
#  alias RealDealApi.Accounts.Account
  
  @primary_key { :id, :binary_id, autogenerate: true }
  @foreign_key_type :binary_id
  schema "users" do
    field :biography, :string
    field :full_name, :string
    field :gender, :string
    # field :account_id, :binary_id
    belongs_to :account, RealDealApi.Accounts.Account
    
    timestamps()
  end
  
  @doc false
  def changeset(user, attrs) do
    # TODO <cast>: Validates that one or more fields are
    # present in the changeset. You can pass a single field name
    # or a list of field names that are required.
    # TODO <validate_required>: Validates that one or more fields are
    # present in the changeset. You can pass a single field name
    # or a list of field names that are required.
    user
    |> cast(attrs, [ :account_id, :full_name, :gender, :biography ])
    |> validate_required([ :account_id ])
  end
end
