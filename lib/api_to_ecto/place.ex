defmodule ApiToEcto.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :name, :string
    field :address, :string
    field :lat, :float
    field :lon, :float

    timestamps()
  end

  def changeset(place, params \\ %{}) do
    place
    |> cast(params, [:name, :address, :lat, :lon])
    |> validate_required([:name, :address, :lat, :lon])
    |> validate_email()
  end

  def validate_email(cs) do
    cs
    |> validate_required(:name, message: "Please enter your name.")
    |> unique_constraint([:name, :address], message: "Name has already been retrienved.")
    |> unsafe_validate_unique(:name, ApiToEcto.Repo, message: "Name has already been retrienved.")
  end
end
