class RemoveCategoryFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :category
  end

  def down
    add_column :posts, :category, :integer
  end
end
