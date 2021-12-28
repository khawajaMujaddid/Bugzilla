class AddToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :assgined_to, :integer
    add_column :bugs, :status, :string
  end
end
