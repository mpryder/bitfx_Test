class CreateFxRates < ActiveRecord::Migration
  def change
    create_table :fx_rates do |t|
      t.date :value_date
      t.string :currency
      t.float :rate

      t.timestamps
    end
  end
end
