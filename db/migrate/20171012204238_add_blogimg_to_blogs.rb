class AddBlogimgToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :blogimg, :string
  end
end
