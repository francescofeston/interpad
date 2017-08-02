class CreateMyGlossaries < ActiveRecord::Migration
  def change
    create_table :my_glossaries do |t|
      t.string :name
      t.string :lang1
      t.string :lang2

      t.timestamps
    end
  end
end
