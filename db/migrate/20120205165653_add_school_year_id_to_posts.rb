class AddSchoolYearIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :school_year_id, :interger

  end
end
