class CreateCupons < ActiveRecord::Migration
  def change
    create_table :cupons do |t|
      t.string :cupon_code
      t.string :store

      t.timestamps null: false
    end
  end
end
