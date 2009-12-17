class Archivo < ActiveRecord::Base
 
  
  has_one :db_file

  has_attachment :content_type => :image,
                 :storage => :db_file,
                 :max_size => 500.kilobytes,
                 :resize_to => [90,90],
                 :thumbnails => { :thumb => [90,90] }

  validates_as_attachment

  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end

 
end
