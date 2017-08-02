class CreateMyWords < ActiveRecord::Migration
  def change
    create_table :my_words do |t|
      t.string :lang1
      t.string :lang2
      t.references :my_glossary

      t.timestamps
    end
    add_index :my_words, :my_glossary_id
  end
end
