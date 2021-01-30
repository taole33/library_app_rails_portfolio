class CreateLends < ActiveRecord::Migration[5.2]
  def change
    create_table :lends do |t|
      t.string :lenddate
      t.string :datetime

      t.timestamps
    end
  end
end
