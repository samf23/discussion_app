class MakeCommentNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :comment, false
  end
end
