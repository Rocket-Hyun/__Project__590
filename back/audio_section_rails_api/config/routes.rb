Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/clips' => 'clips#create_clip'
  get '/audios/:audio_id/clips/:clip_key_value' => 'clips#get_clip'
  get '/tests' => 'tests#get_test'
  post '/tests' => 'tests#post_test'
end
