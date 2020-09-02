class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.string :data
      t.string :meaning
      t.string :reading
      t.string :kunreading
      t.string :onreading
      t.text :syn
      t.text :tos
      t.text :meaningmem
      t.text :readingmem
      t.integer :srslevel
      t.string :cardtype
      t.integer :user_id

      t.timestamps
    end
  end
end
