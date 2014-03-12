class CreateMarriageActs < ActiveRecord::Migration
  def change
    create_table :marriage_acts do |t|
      t.integer :number
      t.integer :year
      t.string :registry
      t.string :part
      t.string :serie
      t.date :marriage_date

      t.timestamps
    end
  end
end
