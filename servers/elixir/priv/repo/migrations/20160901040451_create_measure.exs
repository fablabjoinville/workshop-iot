defmodule IotServer.Repo.Migrations.CreateMeasure do
  use Ecto.Migration

  def change do
    create table(:measures) do
      add :type, :string, null: false
      add :value, :float, null: false

      timestamps()
    end

  end
end
