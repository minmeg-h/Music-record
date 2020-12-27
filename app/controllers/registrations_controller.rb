class RegistrationsController < ApplicationController
 protected 
 def update_resource(resource, params)
   resource.update_without_current_password(params)
 end
end
