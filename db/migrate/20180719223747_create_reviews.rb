class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
    add_reference :reviews, :product, index: true
    add_reference :reviews, :user, index: true
  end
end
