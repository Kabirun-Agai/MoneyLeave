class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource) 
        "/money_m/index"
    end

    def after_sign_up_path_for(resource)
     　 "/money_m/index"  
    end

    def after_update_path_for(resource)
        "/money_m/index" 
    end

     
end
