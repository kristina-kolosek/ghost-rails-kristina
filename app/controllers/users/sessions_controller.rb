class Users::SessionsController < Devise::SessionsController
  layout "authentication"

  def new
    if User.count.zero?
      redirect_to register_path
      return
    end
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to root_path
  end
end
