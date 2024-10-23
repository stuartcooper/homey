class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.uuid :project_id
      t.text :body

      t.timestamps
    end
    add_foreign_key :comments, :projects, column: :project_id
    add_index :comments, :project_id
  end
end
