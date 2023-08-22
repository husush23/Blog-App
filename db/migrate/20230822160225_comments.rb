class Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.refrences :author_id, foreign_key: {to_table: :users}
      t.refrences :post_id, foreign_key: {to_table: :posts}
      t.text :text

      t.timestamps
    end
  end
end
