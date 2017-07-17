class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.column :author, :string
      t.column :content, :string
    end
  end
end
