class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.integer :practice_type
      t.datetime :presentation_date
      t.integer :sentence_id
      t.integer :actor_id
      t.integer :defendant_id
      t.integer :magistrate_id
      t.integer :marriage_act_id

      t.timestamps
    end
  end
end
