class CreateJoinTableDressSize < ActiveRecord::Migration[7.1]
  def change
    create_join_table :dresses, :sizes do |t|
      t.index [:dress_id, :size_id]
    end
  end
end
