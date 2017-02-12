class AddCommentsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :comment, :string
    add_index :posts, :comment
  end
end
