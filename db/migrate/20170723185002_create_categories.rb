class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :opening_balance, precision: 10, scale: 2
      t.decimal :current_balance, precision: 10, scale: 2
      t.timestamps
    end
  end
end
