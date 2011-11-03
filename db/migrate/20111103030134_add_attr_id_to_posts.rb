class AddAttrIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :attr_id, :integer
  end
end
