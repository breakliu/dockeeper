class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer
  end

  def down
    remove_column :posts, :category_id
  end
end
