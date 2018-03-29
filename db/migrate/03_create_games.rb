class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :console
    end
  end
end
