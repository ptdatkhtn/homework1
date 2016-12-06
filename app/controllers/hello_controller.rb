class HelloController < ApplicationController
def index
  @name = params[:nhap]

end
render 'index'
end
