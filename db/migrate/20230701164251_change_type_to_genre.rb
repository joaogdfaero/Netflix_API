class ChangeTypeToGenre < ActiveRecord::Migration[7.0]
  def change
    rename_column :netflixes, :type, :genre
    change_column :netflixes, :genre, :string
  end
end
