class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json' 

    get '/owner' do
        owner = Owner.all
        owner.to_json
      end

      get '/animal' do
        animal = Animal.all.sort
        animal.to_json
      end

      get '/animal/:id' do
        animal = Animal.find(params[:id])
        animal.to_json
        animal.to_json(only: [:id, :image, :name, :age, :breed, :gender], include: {
            owner: { only: [:name] }
          })
    end

    delete '/animal/:id' do
      animal = Animal.find(params[:id])
      animal.destroy
      animal.to_json
      end

      post '/animal' do
        animal = Animal.create(
          image: params[:image],
          name: params[:name],
          age: params[:age],
          breed: params[:breed],
          gender: params[:gender]
        )
        animal.to_json
      end

      patch '/animal/:id' do
        animal = Animal.find(params[:id])
        animal.update(
          name: params[:name],
          age: params[:age],
          breed: params[:breed],
          gender: params[:gender]
        )
        animal.to_json
      end
  end