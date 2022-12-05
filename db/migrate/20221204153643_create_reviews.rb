class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :likes
      t.string :review_body
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
     
      t.timestamps
    end
  end
end
