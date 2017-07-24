class AddLikeCountToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :like_count, :text, array: true, default: []
  end
end
