class AddNameToAdminuser < ActiveRecord::Migration[5.0]
  def change
    add_column :adminusers, :name, :string
  end
end
