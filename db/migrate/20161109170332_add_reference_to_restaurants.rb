class AddReferenceToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_reference :restaurants, :user
  end
end
