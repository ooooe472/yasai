class AddHashbodyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :hashbody, :text
  end
end
