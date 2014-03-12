json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :number, :year, :sentence_date, :publication_date, :role_number, :role_year
  json.url sentence_url(sentence, format: :json)
end
