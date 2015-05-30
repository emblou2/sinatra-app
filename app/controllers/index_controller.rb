require 'sinatra'

get '/:birthdate' do
  setup_index_view
end

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = Person.get_message(birth_path_num)
  erb :index
end

get '/' do
  erb :form
end

  post '/' do
    if params[:birthdate].include?("-")
      birthdate = params[:birthdate]
    else
      birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
    end
  
    @person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
    if @person.valid?
      @person.save
      redirect "/people/#{@person.id}"
    else
      @error = "The data you entered isn't valid"
      erb :"/people/new"
    end
  end

def setup_index_view
  birthdate = params[:birthdate]
  birth_path_num = Person.get_birth_path_num(birthdate)
  @message = Person.get_message(birth_path_num)
  erb :index
end
