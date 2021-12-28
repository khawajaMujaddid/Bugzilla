class AddColumnToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :comments, :text
  end
end
