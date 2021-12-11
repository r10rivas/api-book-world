class CreateBookWriters < ActiveRecord::Migration[6.1]
  def change
    create_table :book_writers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :writer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
