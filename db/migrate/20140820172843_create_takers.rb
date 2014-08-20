class CreateTakers < ActiveRecord::Migration
  def change
    create_table :takers do |t|
      t.column :name, :string
    end
  end
end
