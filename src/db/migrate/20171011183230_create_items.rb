class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.decimal :price
      t.string :name
      t.attachment :picture
      t.boolean :featured

      t.timestamps
    end
  end
end
