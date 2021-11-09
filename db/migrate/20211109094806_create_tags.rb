class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tagged
      # t.integer :user_id
      t.integer :blob_id
      t.timestamps
    end
  end
end
