alias ApiToEcto.Repo

# ApiToEcto.api_call("https://api.data.metro.tokyo.lg.jp/v1/WifiAccessPoint")
# |> Enum.map(&ApiToEcto.get(&1) |> Repo.insert())

ApiToEcto.read_csv("lat-lon.csv")
|> Enum.map(&ApiToEcto.map_extract(&1) |> Repo.insert())
