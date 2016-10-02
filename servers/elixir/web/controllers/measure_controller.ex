defmodule IotServer.MeasureController do
  use IotServer.Web, :controller

  alias IotServer.Measure

  def index(conn, _params) do
    measures = Repo.all(Measure)
    render(conn, "index.html", measures: measures)
  end

  def create(conn, %{"measure" => measure_params}) do
    changeset = Measure.changeset(%Measure{}, measure_params)

    case Repo.insert(changeset) do
      {:ok, measure} ->
        conn
        |> put_status(:created)
        |> render("show.json", measure: measure)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(IotServer.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
