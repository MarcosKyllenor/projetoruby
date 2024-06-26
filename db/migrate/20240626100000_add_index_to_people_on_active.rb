class AddIndexToPeopleOnActive < ActiveRecord::Migration[7.0]
  def change
    add_index :people, :active
  end
end