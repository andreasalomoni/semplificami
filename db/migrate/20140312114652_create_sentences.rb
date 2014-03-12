class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :number
      t.integer :year
      t.datetime :sentence_date
      t.datetime :publication_date
      t.integer :role_number
      t.integer :role_year

      t.timestamps
    end
  end
end
