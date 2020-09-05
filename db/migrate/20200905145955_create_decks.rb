class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :title
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.integer :cardcount

      t.timestamps
    end
  end
end
