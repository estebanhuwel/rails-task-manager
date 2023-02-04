class ChangeParameterNameDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :details, from: true, to: false
  end
end
