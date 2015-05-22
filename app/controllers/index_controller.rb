get '/:birthdate' do
  setup_index_view
end
 
get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = get_message(birth_path_num)
  erb :index
end
 
get '/' do
  erb :form
end