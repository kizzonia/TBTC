class CreateKbs < ActiveRecord::Migration[5.0]
  def change
    create_table :kbs do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string  :slug, unique: true, index: true
      t.integer :managment_id

      t.timestamps
    end
  end
end
