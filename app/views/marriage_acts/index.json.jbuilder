json.array!(@marriage_acts) do |marriage_act|
  json.extract! marriage_act, :id, :number, :year, :registry, :part, :serie, :marriage_date
  json.url marriage_act_url(marriage_act, format: :json)
end
