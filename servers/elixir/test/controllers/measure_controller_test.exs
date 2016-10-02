defmodule IotServer.MeasureControllerTest do
  use IotServer.ConnCase

  alias IotServer.Measure
  @valid_attrs %{value: "120.5", type: "humidity"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, measure_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing measures"
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, measure_path(conn, :create), measure: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Measure, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, measure_path(conn, :create), measure: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
