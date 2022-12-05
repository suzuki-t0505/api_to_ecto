defmodule ApiToEcto.Places do
  alias ApiToEcto.Repo
  alias ApiToEcto.Place
  import Ecto.Query

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

  def get_place_by_name(name) do
    Place
    |> where([p], p.name == ^name)
    |> Repo.one()
  end

  def select_address() do
    Place
    |> select([p], p.address)
    |> Repo.all()
  end

  def get_places_to_search_by_address(value) do
    pattern = "%#{value}%"

    query =
      from(p in Place,
        where: like(p.address, ^pattern)
      )

    Repo.all(query)
  end
end
