class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.belongs_to :game, index: true
      t.timestamps
    end
  end
end
