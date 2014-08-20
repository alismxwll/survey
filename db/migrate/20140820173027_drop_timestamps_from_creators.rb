class DropTimestampsFromCreators < ActiveRecord::Migration
  def change
    remove_column :creators, :updated_at, :datetime
  end
end
