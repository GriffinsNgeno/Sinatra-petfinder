class ApplicationController < Sinatra::Base

    get '/' do
        { message: "Hello world" }.to_json
    end
    
    get '/owner' do
        owner = Owner.all.order(:name).limit(10)
        owner.to_json
      end

      get '/animal/:id' do
        animal = Animal.find(params[:id])
        animal.to_json
        animal.to_json(only: [:id, :image, :name, :age, :breed, :gender], include: {
            owner: { only: [:name] }
          } 
        )
    end
  end