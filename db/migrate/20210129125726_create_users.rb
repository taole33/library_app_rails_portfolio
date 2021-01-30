class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.datetime :userbirthday
      t.text :useraddress

      t.timestamps
    end
  end
end
