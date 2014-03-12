class Sentence < ActiveRecord::Base
  has_one :practice


  def initialize(attributes = {})
    attributes = Sentence.default_values.merge attributes
    super
  end

  private
  def self.default_values
    {
        'sentence_date' => Date.today,
        'publication_date' => Date.today,
        'year' => Date.today.year,
        'role_year' => Date.today.year
    }
  end
end
