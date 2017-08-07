class AddImageToPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :postings, :image, :string
  end
end
