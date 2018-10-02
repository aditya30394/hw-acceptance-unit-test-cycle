require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    
    it 'destroys a movie with given id' do
        movie = Movie.create(:title => "Dark Knight Rises", :director => "Christopher Nolan")
        delete :destroy, :id => movie.id
        expect{Movie.find(movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'tests creation of a movie' do
        post :create, :movie => { :title => "T", :director => "D", :rating => "R", :release_date =>"09/09/2010"}
        expect(flash[:notice]).to be_present
        expect(response).to redirect_to(movies_path)
    end
    
end
