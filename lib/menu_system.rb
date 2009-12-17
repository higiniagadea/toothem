class Hash

  def <<(hash)
    hash.each{|key, value|
      self[key] = value
    }
  end

end

module MenuSystem

  def current_role
    if logged_in?
      @current_role = User.find(session[:user_id]).roles.first.name.to_sym
    end
  end

  def current_menu
    @current_menu = menu[@current_role]
    @current_menu ||= Hash.new
    @current_menu << menu[:all] unless menu[:all].nil?
    @current_menu
  end

  def self.included( recipient )
    recipient.send :class_inheritable_hash, :menu
    recipient.send :menu=, {}
    recipient.send :before_filter, :current_role, :current_menu
    recipient.extend( MenuRoleClassMethods )
  end

  module MenuRoleClassMethods
    def menu_role(role, hash_menu_role)
      menu[role] ||= Hash.new
      menu[role] << hash_menu_role
    end

  end

end

