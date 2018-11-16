class CreateLawyers < ActiveRecord::Migration[5.2]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :state
      t.string :order

      t.timestamps
    end
  end
end
