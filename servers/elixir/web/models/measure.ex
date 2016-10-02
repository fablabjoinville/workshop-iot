defmodule IotServer.Measure do
  use IotServer.Web, :model

  @types ["humidity", "temperature"]

  schema "measures" do
    field :value, :float
    field :type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:value, :type])
    |> validate_required([:value, :type])
    |> validate_inclusion(:type, @types)
  end
end
