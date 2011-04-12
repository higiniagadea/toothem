class Periodo < ActiveRecord::Base
  acts_as_paranoid
  
belongs_to :saldo_paciente

 validates_presence_of :mes, :message=> 'No puede estar en blanco'
 validates_presence_of :anio, :message=> 'No puede estar en blanco'

    named_scope :by_anio, lambda { |anio|
    {
      :conditions=> ['age(anio) LIKE :anio',
          { :anio=> "%"+anio.downcase+"%"} ]
    }
  }

  def self.buscar(options)
      scope_builder do |builder|
       builder.by_anio(options[:anio]) unless options[:anio].blank?
      end
  end
end