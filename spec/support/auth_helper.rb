module AuthHelper
  def http_login
    @user = User.create(name: 'Emily', email: 'email@email.com', password: 'password')
    user = "email@email.com"
    pw = 'password'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end  
end