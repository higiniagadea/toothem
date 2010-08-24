# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def nested_error_messages_for(object)
      if ([Symbol, String].member? object.class)
        object = instance_variable_get("@#{object}")
      end
      unless object.nil? || object.errors.count.zero?
        error_messages = object.errors.to_a.uniq.map do |key, value|
          object2 = object.send(key)
          if object2.is_a?(Array)
            object2.collect {|obj|
              content_tag(:li, nested_error_messages_for(obj))
            }
          elsif object2.is_a?(ActiveRecord::Base)
            content_tag(:li, nested_error_messages_for(object2))
          elsif value.match(/^\^/)
            content_tag(:li, value[1..value.length])
          else
            content_tag(:li,
               "#{key.underscore.split('_').join(' ').humanize} #{value}")
          end
        end
           content_tag(:span,  error_messages, :class => 'error_field')
        else
          ''
        end
    end

    def boolean_desc (objeto)

      if objeto
        "Si"
      else
        "No"
      end
   
    end

    #Pone la primer letra del string en mayuscula y el resto en minuscula
  def format_str(string)
    string[0,1].upcase + string[1,string.size].downcase

  end


    

end
