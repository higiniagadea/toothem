module ItemsHelper
  def display_items(items)
	   ret = "<ul style='line-height:20px'>"
	   items.each do |item|
		    if item.parent_id == 0 || item.parent_id.blank?
          ret += "<li onmouseover='$(\"#options_#{item.id}\").css(\"display\",\"inline\")' onmouseout='$(\"#options_#{item.id}\").css(\"display\",\"none\")'>"
          ret += item.nombre + "<div id='options_#{item.id}' style='display:none'> "
          #ret+= link_to(image_tag('16/pencil.png',:style => 'vertical-align:middle'),edit_item_url(item)) + " "
          #ret += link_to(image_tag('16/cancel.png',:style => 'vertical-align:middle'),item, :confirm => 'esta seguro?', :method=>:delete)+ " "
          ret+= link_to(image_tag('16/add.png',:style => 'vertical-align:middle'),:action => 'new', :item_id => item)
          ret +="</div>"

          ret += find_all_subitems(item)
        	ret += "</li>"
		    end

	   end
        ret += "</ul>"
    end

   def find_all_subitems(item)
    if item.children.size > 0
      ret = '<ul style="line-height:20px;list-style:disc">'
      item.children.each { |subitem|
        if subitem.children.size > 0
          ret += "<li onmouseover='$(\"#options_#{subitem.id}\").css(\"display\",\"inline\")' onmouseout='$(\"#options_#{subitem.id}\").css(\"display\",\"none\")'>"
          ret += subitem.nombre +  "<div id='options_#{subitem.id}' style='display:none'>"
          ret += link_to(image_tag('16/pencil.png',:style => 'vertical-align:middle'),edit_item_url(subitem))+ " "
          ret += link_to(image_tag('16/cancel.png',:style => 'vertical-align:middle'),subitem, :confirm => 'esta seguro?', :method=>:delete)+ " "
          ret+= link_to(image_tag('16/add.png',:style => 'vertical-align:middle'),:action => 'new', :item_id => subitem)
          ret +="</div>"
          ret += find_all_subitems(subitem)
          
          ret += '</li>'
        else
          ret += "<li onmouseover='$(\"#options_#{subitem.id}\").css(\"display\",\"inline\")' onmouseout='$(\"#options_#{subitem.id}\").css(\"display\",\"none\")'>"
          ret +=  subitem.nombre +  "<div id='options_#{subitem.id}' style='display:none'>"
          ret += link_to(image_tag('16/pencil.png',:style => 'vertical-align:middle'),edit_item_url(subitem))+ " "
          ret += link_to(image_tag('16/cancel.png',:style => 'vertical-align:middle'),subitem, :confirm => 'esta seguro?', :method=>:delete)+ " "
          ret+= link_to(image_tag('16/add.png',:style => 'vertical-align:middle'),:action => 'new', :item_id => subitem)
          ret += '</div>'
          ret += '</li>'
        end
        }
      ret += '</ul>'
    end
  end
end
