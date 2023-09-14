class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
    
      t.string :string
      t.text :meet
      t.string :integer

      t.timestamps
    end
  end
end
