class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :full_name
      t.string :cpf
      t.string :email
      t.string :birthdate
      t.string :phone
      t.boolean :status

      t.timestamps
    end
  end
end
