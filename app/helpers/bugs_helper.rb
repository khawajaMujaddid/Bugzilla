module BugsHelper

   def update_att(model, attribute, value, message)
    model.update_attribute(attribute, value)
    flash[:success] = message
   end

end
