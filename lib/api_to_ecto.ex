defmodule ApiToEcto do
  alias ApiToEcto.Place
  def api_call(api \\ "https://api.data.metro.tokyo.lg.jp/v1/WifiAccessPoint") do
    api
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> hd()
  end

  # def gets(data), do: Enum.map(data, &get(&1))

  def map_extract(mapdata) do
    %Place{
      name: mapdata["大字町丁目コード"],
      address: mapdata["都道府県名"] <> mapdata["市区町村名"] <> mapdata["大字町丁目名"],
      lat: String.to_float(mapdata["経度"]),
      lon: String.to_float(mapdata["緯度"])
    }
  end

  def read_csv(path) do
    path
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.map(& &1)
  end
end
