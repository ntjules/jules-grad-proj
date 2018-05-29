class CreateCoffeebins < ActiveRecord::Migration[5.1]
  def change
    create_table :coffeebins do |t|
      t.float :quantity
      t.boolean :payed

      t.timestamps
    end
  end
end
