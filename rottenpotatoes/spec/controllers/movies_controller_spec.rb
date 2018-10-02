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
    
    it 'tests index function of the controller when sort is title' do
        get(:index, :sort => "title", :sort => "release_date")
        expect(flash[:notice]).to be_nil
        expect(response).to redirect_to(movies_path(:sort => 'release_date', :ratings => {"G" =>"G", "NC-17" => "NC-17", "PG" => "PG", "PG-13" =>"PG-13", "R" =>"R"}))
    end
    
    it 'tests index function of the controller when sort is release_date' do
        get(:index, :sort => "release_date", :sort => "title")
        expect(flash[:notice]).to be_nil
        expect(response).to redirect_to(movies_path(:sort => 'title', :ratings => {"G" =>"G", "NC-17" => "NC-17", "PG" => "PG", "PG-13" =>"PG-13", "R" =>"R"}))
    end
    
end
