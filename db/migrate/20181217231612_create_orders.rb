class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
