defmodule IotServer.MeasureTest do
  use IotServer.ModelCase

  alias IotServer.Measure

  @valid_attrs %{value: "120.5", type: "humidity"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Measure.changeset(%Measure{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Measure.changeset(%Measure{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid type" do
    attrs_with_invalid_type = %{value: "120.5", type: "invalid"}
    changeset = Measure.changeset(%Measure{}, attrs_with_invalid_type)
    refute changeset.valid?
  end
end
