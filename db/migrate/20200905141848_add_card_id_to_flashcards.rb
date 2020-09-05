class AddCardIdToFlashcards < ActiveRecord::Migration[6.0]
  def change
    add_column :flashcards, :card_id, :integer
  end
end
