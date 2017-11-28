require 'pry'

class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure]["name"]
    @figure.title_ids = params[:figure]["title_ids"]
    @figure.titles << Title.find_or_create_by(name: params[:title]["name"])
    @figure.landmark_ids = params[:figure]["landmark_ids"]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark]["name"])
    @figure.save

    redirect to "figures/#{@figure.id}"
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure]["name"])
    @figure.title_ids = params[:figure]["title_ids"]
    @figure.titles << Title.find_or_create_by(name: params[:title]["name"])
    @figure.landmark_ids = params[:figure]["landmark_ids"]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark]["name"])
    @figure.save

    redirect to "figures/#{@figure.id}"
  end
end
