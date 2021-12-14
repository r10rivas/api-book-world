class CreateWriters < ActiveRecord::Migration[6.1]
  def change
    create_table :writers do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_birth
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
