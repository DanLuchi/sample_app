module SessionsHelper

  def sign_in(user)
    # Session sign in - signed out when browser closes
    session[:user] = user.id 

    # Permanent cookie sign in - not signed out when browser closes
    # cookies.permanent.signed[:remember_token] = [user.id, user.salt]

    # A session will end when the browser is closed if 'permanent' is not used
    # cookies.signed[:remember_token] = [user.id, user.salt]

    self.current_user = user
  end

  def current_user=(user)
    @current_user = user  
  end

  def current_user
    # For sessions
    @current_user ||= User.find_by_id(session[:user])    

    # For cookies
    # @curent_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    # Session delete 
    session.delete(:user)

    # Cookie delete
    # cookies.delete(:remember_token)
    self.current_user = nil
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
