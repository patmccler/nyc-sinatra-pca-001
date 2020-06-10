class LandmarksController < ApplicationController
  set :views, proc { File.join(root, '../views/') }

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    Landmark.create(params[:landmark])

    redirect "/landmarks"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])

    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])

    erb :"landmarks/edit"
  end

  patch "/landmarks/:id" do
    Landmark.find(params[:id]).update(params[:landmark])

    redirect to("/landmarks/#{params[:id]}")
  end
end
