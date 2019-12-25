class AddColoumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name ,:string , null: false ,unique: true
    add_column :users, :mobile,:string , null: false ,unique: true

  end
end
