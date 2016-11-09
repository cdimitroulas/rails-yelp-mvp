class AddForeignKeyToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user
  end
end
