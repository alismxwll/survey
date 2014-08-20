class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :choice
      t.integer :question_id
    end
  end
end
