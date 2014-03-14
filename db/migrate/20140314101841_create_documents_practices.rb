class CreateDocumentsPractices < ActiveRecord::Migration
  def change
    create_table :documents_practices do |t|
      t.integer :practice_id
      t.integer :document_id
    end
  end
end
