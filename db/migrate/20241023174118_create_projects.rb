class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name
      t.string :status, null: false
      t.timestamps
    end
  end
end
