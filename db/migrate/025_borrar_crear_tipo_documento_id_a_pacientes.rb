class BorrarCrearTipoDocumentoIdAPacientes < ActiveRecord::Migration
  def self.up
   #remove_column :pacientes, :tipo_documento
   #add_column :pacientes, :tipo_documento_id, :integer
  end

  def self.down
    remove_column :pacientes, :tipo_documento_id
    add_column :pacientes, :tipo_documento, :string
  end
end
