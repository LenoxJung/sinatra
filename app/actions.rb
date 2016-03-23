# Homepage (Root path)
get '/' do
  erb :index
end

# Messages GET
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

# Messages POST
post '/messages' do
  @message = Message.new(
    title: params[:title], 
    content: params[:content], 
    author: params[:author]
    )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

# Messages New GET
get '/messages/new' do
  erb :'messages/new'
end

# View Message by ID GET
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end