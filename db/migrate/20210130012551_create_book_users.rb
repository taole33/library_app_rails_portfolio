class CreateBookUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :book_users do |t|
      t.references :book, index: true
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
