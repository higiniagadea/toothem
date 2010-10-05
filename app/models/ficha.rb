class Ficha < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :profesional
  has_many :tratamientos
  #accepts_nested_attributes_for :tratamientos

  named_scope :by_profesional, lambda { |profesional|
    {
      :conditions=> ['lower(profesional) LIKE :nombre ',
        { :nombre => "%"+profesional.downcase+"%"} ]
    }
  }

  named_scope :by_fecha, lambda { |fecha|
    {
      :conditions => ['lower(fecha) LIKe :fecha',
        { :fecha => "%"+fecha.downcase+"%"} ]
    }
  }


end

