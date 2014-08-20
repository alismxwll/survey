class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
