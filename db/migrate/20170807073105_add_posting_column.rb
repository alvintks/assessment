class AddPostingColumn < ActiveRecord::Migration[5.1]
  def change
     add_column :postings, :address, :string
    add_column :postings, :latitude, :float
    add_column :postings, :longitude, :float
  end
end
