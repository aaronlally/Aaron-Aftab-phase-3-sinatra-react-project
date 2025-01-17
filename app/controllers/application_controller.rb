class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    puts "you are home"
  end

  post "/auth" do
    user = Author.find_by(email: params[:email])
    if user
      user.to_json
    else
      newUser = Author.create(name: params[:name], email: params[:email], birth_year: rand(1895..2015))
      newUser.to_json
    end
  end

  get "/books" do
    books = Book.all
    books.to_json
  end

  post "/add_book" do
    book = Book.create(
      title: params[:title],
      rating: params[:rating],
      release_date: params[:release_date],
      author_id: params[:author_id]
    )
    book.to_json
  end

  patch "/book/:id" do
    book = Book.find(params[:id])
    book.update(
      title: params[:title],
      rating: params[:rating],
      release_date: params[:release_date],
      author_id: params[:author_id]
    )
    book.to_json
  end

  delete "/book/:id" do
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end

  get "/authors" do
    authors = Author.all
    authors.to_json
  end

end
