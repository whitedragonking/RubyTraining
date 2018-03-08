class WelcomeController < ApplicationController
  def index
    @helloWorld = "Hello World !!!"
    @time = Time.now
  end
end
