json.array!(@ranks) do |rank|
  json.extract! rank, :id, :nickname, :content, :star, :food
  json.url rank_url(rank, format: :json)
end
