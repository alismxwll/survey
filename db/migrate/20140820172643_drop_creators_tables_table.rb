class DropCreatorsTablesTable < ActiveRecord::Migration
  def change
    drop_table :creators_tables
  end
end
