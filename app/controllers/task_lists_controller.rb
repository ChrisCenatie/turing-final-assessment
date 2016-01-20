class TaskListsController < ApplicationController
  before_action :authenticate

  def index
    render text: "hello"
  end
end
