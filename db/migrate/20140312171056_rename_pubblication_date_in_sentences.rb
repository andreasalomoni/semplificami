class RenamePubblicationDateInSentences < ActiveRecord::Migration
  def up
    rename_column :sentences, :publication_date, :publication_date
  end
  def down
    rename_column :sentences, :publication_date, :publication_date
  end
end
