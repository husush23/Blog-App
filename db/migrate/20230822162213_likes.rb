class Likes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.refrences :author_id, foreign_key: {to_table: :users}
    end
  end
end
