class SetDefaultFalseCompleted < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:tasks, :completed, default: false)
  end
end
