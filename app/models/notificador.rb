class Notificador < ActionMailer::Base
  def cambio_de_clave(recipient)
     recipients recipient.email
     from       "higinia@ipcorp.com.ar"
     subject    "Cambio de clave Toothem"
     body       :usuario => recipient
     content_type "text/html"
   end

  def envio_clave_nueva(recipient)
    recipients recipient.email
     from      "higinia@ipcorp.com.ar"
     subject    "Cambio de clave Toothem"
     body       :usuario => recipient
     content_type "text/html"
  end


end
