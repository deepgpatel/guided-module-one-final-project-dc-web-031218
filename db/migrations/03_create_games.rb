class CreateGames < ActiveMigration::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :console
    end
  end
end
