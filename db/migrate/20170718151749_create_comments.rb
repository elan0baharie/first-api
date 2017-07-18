class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.column :commenter, :string
      t.column :body, :string
      t.column :quote_id, :integer
      
      t.timestamps
    end
  end
end
