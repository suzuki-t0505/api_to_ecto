defmodule ApiToEcto.Places do
  alias ApiToEcto.Repo
  alias ApiToEcto.Place

  def get_places() do
    Repo.all(Place)
  end

  def get_place(id) when is_integer(id) do
    Repo.get(Place, id)
  end

  def get_place(_id), do: nil

  def create_place(params) do
    %Place{}
    |> Place.changeset(params)
    |> Repo.insert()
  end

  def update_place(place, params) do
    place
    |> Place.changeset(params)
    |> Repo.update()
  end

  def delete_place(id) when is_integer(id) do
    if place = Repo.get(Place, id) do
      Repo.delete(place)
    else
      nil
    end
  end

  def delete_place(_id), do: nil
end
