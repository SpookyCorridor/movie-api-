require 'bundler'
Bundler.require

require 'sinatra/base'

class Movies < Sinatra::Base

    def movie_data(name, release_year, description)
    {:name => name, :release_year => release_year, :description => description}.to_json
    end 

    get '/api/:name' do 
        @name = params[:name]
        get_movie(@name)
    end 

    def get_movie(movie)
        case movie
        when 'kill-bill'
          movie_data('Kill Bill Vol. 1', '2003', 
            'A former assassin, known simply as The Bride (Uma Thurman), wakes from a coma four years after her jealous ex-lover Bill (David Carradine) attempts to murder her on her wedding day.')
        when 'Edward Scissorhands'
          movie_data('Edward Scissorhands', '1990',
           "A scientist (Vincent Price) builds an animated human being -- the gentle Edward (Johnny Depp). The scientist dies before he can finish assembling Edward, though, leaving the young man with a freakish appearance accentuated by the scissor blades he has instead of hands. Loving suburban saleswoman Peg (Dianne Wiest) discovers Edward and takes him home, where he falls for Peg's teen daughter (Winona Ryder). However, despite his kindness and artistic talent, Edward's hands make him an outcast.") 
        when 'the colour of pomegranates'
            movie_data('the colour of pomegranates', '1968',
           "This avant-garde film by Russian director Sergei Parajanov depicts the life of revered the 18th-century Armenian poet and musician Sayat-Nova (Vilen Galstyan). Portraying events in the life of the artist from childhood up to his death, the movie addresses in particular his relationships with women, including his muse (Sofiko Chiaureli). The production tells Sayat-Nova's dramatic story by using both his poems and largely still camerawork, creating an impressionistic work." 
        else 
          'movie not found'
        end 
    end 

end #end class 