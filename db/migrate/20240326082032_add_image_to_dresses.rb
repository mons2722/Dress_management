class AddImageToDresses < ActiveRecord::Migration[7.1]
  def change
    add_column :dresses, :image, :string
  end
end
