class HomeController < ApplicationController
  def index
    @posts = Post.all
    @blogs = Blog.order("created_at").last
  end
end
