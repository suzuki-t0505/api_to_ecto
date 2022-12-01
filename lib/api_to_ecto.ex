defmodule ApiToEcto do
  alias ApiToEcto.Places
  def api_call(api \\ "https://api.data.metro.tokyo.lg.jp/v1/WifiAccessPoint") do
    [data, _] = api
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    data
  end

  def gets(data), do: Enum.map(data, &get(&1))

  def get(h) do
    [name | _] = h["設置地点"]["名称"]

    %Places{
      name: name["表記"],
      address: h["設置地点"]["住所"]["表記"],
      lat: String.to_float(h["設置地点"]["地理座標"]["経度"]),
      lon: String.to_float(h["設置地点"]["地理座標"]["緯度"])
    }
  end
end
