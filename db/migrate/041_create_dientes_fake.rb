class CreateDientesFake <  ActiveRecord::Migration
  def self.up
    create_table "dientes_fakes" do |t|

        t.column :diente, :integer
        t.column :cara_superior, :string
        t.column :cara_inferior, :string
        t.column :cara_izquierda, :string
        t.column :cara_derecha, :string
        t.column :centro, :string

      t.timestamps
    end

  end

  def self.down
    drop_table "dientes"
  end
end
