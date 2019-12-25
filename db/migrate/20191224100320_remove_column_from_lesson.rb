class RemoveColumnFromLesson < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lessons, :user, null: false, foreign_key: true
  end
end
