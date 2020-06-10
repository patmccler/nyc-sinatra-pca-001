class FiguresController < ApplicationController
  set :views, proc { File.join(root, '../views/') }

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    fig = Figure.create(params[:figure])

    fig.titles << Title.create(params[:title]) if params[:title]
    fig.landmarks << Landmark.create(params[:landmark]) if params[:landmark]

    redirect to("/figures")
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])

    @titles = Title.all
    @landmarks = Landmark.all

    erb :"figures/edit"
  end

  patch "/figures/:id" do
    Figure.find(params[:id]).update(params[:figure])
    fig.titles << Title.create(params[:title]) if params[:title]
    fig.landmarks << Landmark.create(params[:landmark]) if params[:landmark]

    redirect to("/figures/#{params[:id]}")
  end
end
