class RemoveSizeFromDresses < ActiveRecord::Migration[7.1]
  def change
    remove_column :dresses, :size, :string
  end
end
