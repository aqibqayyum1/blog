class AddAgeToArticle < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :subtitle, :string
  end
end
