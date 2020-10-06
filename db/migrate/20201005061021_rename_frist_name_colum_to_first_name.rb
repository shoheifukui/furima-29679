class RenameFristNameColumToFirstName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :frist_name, :first_name
  end
end
