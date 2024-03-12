class AddSizeToDresses < ActiveRecord::Migration[7.1]
  def change
    add_column :dresses, :size, :string
  end
end
