class ApplicationController < ActionController::Base
  def hello
    render html: "hello world👻"
  end
  include SessionsHelper
end
