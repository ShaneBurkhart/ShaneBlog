class AddColumnTagsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tag, :string
  end
end
