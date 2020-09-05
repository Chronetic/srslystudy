class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
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
      t.references :deck, null: false, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
