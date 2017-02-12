require "sinatra"
require "sequel"

c_str = "sqlite://board.db"

get "/" do
  "<a href='/post'>post</a>"
  erb :home
end

get "/post" do
  erb :post
end

post "/post" do
  title = params[:title]
  content = params[:content]

  DB = Sequel.connect(c_str)
  DB[:contents] << {title: title,content: content}

  @contents = DB[:contents]
  erb :post
end

get "/messagelist" do
  DB = Sequel.connect(c_str)
  @contents = DB[:contents]
  erb :messagelist
end

post "/messagelist" do
  DB = Sequel.connect(c_str)
  @contents = DB[:contents]
  erb :messagelist
end

post "/sendmessage" do
  title = params[:title]
  content = params[:content]
  puts title,content

  DB = Sequel.connect(c_str)
  DB[:contents] << {title: title,content: content}

  @contents = DB[:contents]
  erb :messagelist
end
