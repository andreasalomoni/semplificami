json.array!(@practices) do |practice|
  json.extract! practice, :id, :practice_type, :presentation_date, :sentence_id, :actor_id, :defendant_id, :magistrate_id, :marriage_act_id
  json.url practice_url(practice, format: :json)
end
