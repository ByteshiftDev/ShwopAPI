class AddPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :first_password, :string
  end
end
