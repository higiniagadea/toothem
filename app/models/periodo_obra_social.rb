class PeriodoObraSocial < ActiveRecord::Base
  acts_as_paranoid

belongs_to :saldo_obra_social



 validates_presence_of :mes, :message=> 'No puede estar en blanco'
 #validates_presence_of :anio, :message=> 'No puede estar en blanco'

    named_scope :by_mes, lambda { |mes|
    {
      :conditions => ["to_char(mes,'yyyy') = :mes",
          { :mes => mes } ]
    }
  }

  def self.buscar(options)
      scope_builder do |builder|
       builder.by_mes(options) unless options.blank?
      end
  end
end