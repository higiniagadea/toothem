class CreateArchivos < ActiveRecord::Migration
  def self.up
    create_table "archivos" do |t|
        t.column "content_type", :string
        t.column "filename", :string
        t.column "size", :integer
        t.column "parent_id",  :integer
        t.column "thumbnail", :string
        t.column "width", :integer
        t.column "height", :integer
        t.column "db_file_id", :integer
    end
  end

  def self.down
    drop_table "archivos"
  end
end
