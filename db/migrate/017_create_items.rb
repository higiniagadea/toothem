class CreateItems < ActiveRecord::Migration
  def self.up
    create_table "items" do |t|
      t.column :nombre, :string
      t.column :rest_url, :string
      t.column :item_id, :integer
    end
  end

  def self.down
    drop_table "items"
  end
end
