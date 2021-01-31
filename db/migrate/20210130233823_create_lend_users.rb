class CreateLendUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :lend_users do |t|
      t.references :lend
      t.references :user

      t.timestamps
    end
  end
end
