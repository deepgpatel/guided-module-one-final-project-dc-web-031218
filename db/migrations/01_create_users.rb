class CreateUsers < ActiveMigration::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.boolean :employed
    end
  end
end
