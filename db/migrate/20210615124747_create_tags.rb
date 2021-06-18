class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :body
      t.references :post , foreign_key: true
      t.timestamps
    end
  end
end
