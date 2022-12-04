class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string "product_id"
      t.string "name"
      t.string "comment"
      t.integer "rating"
      t.timestamps
    end
  end
end
