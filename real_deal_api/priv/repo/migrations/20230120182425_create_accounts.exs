# Accounts migration file

defmodule RealDealApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration
  
  def change() do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :hash_password, :string
      
      timestamps()
    end
    
    # Creating an index creates a value in our table
    # that allows us to search that table by in this
    # case the variable atom :email. By creating a
    # unique index, it will prevent from adding duplicate values.
    create unique_index(:accounts, [ :email ])
  end
end
