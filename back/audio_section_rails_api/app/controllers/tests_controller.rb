class TestsController < ApplicationController
  def get_test
    @params = params[:test1]

    render json: @params
  end

  def post_test
    @params = params[:test1]

    render json: @params
  end
end
