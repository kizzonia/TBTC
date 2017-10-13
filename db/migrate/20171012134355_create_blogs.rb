class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.text :body
      t.integer :managment_id
      t.string  :slug, unique: true, index: true


      t.timestamps
    end
  end
end
