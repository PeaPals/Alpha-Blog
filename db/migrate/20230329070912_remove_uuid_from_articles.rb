class RemoveUuidFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :UUID
  end
end
