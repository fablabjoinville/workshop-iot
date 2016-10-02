defmodule IotServer.MeasureView do
  use IotServer.Web, :view

  def render("show.json", %{measure: measure}) do
    %{data: render_one(measure, IotServer.MeasureView, "measure.json")}
  end

  def render("measure.json", %{measure: measure}) do
    %{id: measure.id, value: measure.value, type: measure.type}
  end
end
