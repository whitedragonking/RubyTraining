class CreateSClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :s_classes do |t|
      t.string :class_name
      t.integer :teacher_id
      t.string :year
      t.integer :grade_id

      t.timestamps
    end
  end
end
