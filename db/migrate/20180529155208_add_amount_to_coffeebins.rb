class AddAmountToCoffeebins < ActiveRecord::Migration[5.1]
  def change
    add_column :coffeebins, :amount, :float
  end
end
