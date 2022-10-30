class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :public_place
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :ibge_code
      t.references :citizen, foreign_key: true

      t.timestamps
    end
  end
end
