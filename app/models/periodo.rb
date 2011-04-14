class Periodo < ActiveRecord::Base
  acts_as_paranoid
  
belongs_to :saldo_paciente

 validates_presence_of :mes, :message=> 'No puede estar en blanco'
 #validates_presence_of :anio, :message=> 'No puede estar en blanco'

    named_scope :by_mes, lambda { |mes|
    {
      :conditions => ['age(mes) LIKE :mes',
          { :mes => mes } ]
    }
  }

  def self.buscar(options)
      scope_builder do |builder|
       builder.by_mes(options[:mes]) unless options[:mes].blank?
      end
  end
end