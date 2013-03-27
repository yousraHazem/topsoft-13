class ApplicationController < ActionController::Base
  protect_from_forgery
end

def log(obj); logger.info(obj);
end
