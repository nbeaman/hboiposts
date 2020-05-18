Rails.application.routes.draw do
	
	# gets and posts are from the user's point of view not the Server's

	root 'posts#index', as: 'home'

	get '/posts' => 'posts#index'

	post '/posts' => 'posts#create'

	# note: The order of routes matters.  If this was after get '/posts/:id' we would have problems b/c
	# '/posts/new' could be seen ast 'new' being an :id where :id = new triggering an error
	get '/posts/new' => 'posts#new', as: 'new_post'

	# as 'post' (NO 's') is used b/c routes has two post_path. One for 'index' and one for 'show'.  This takes
	# away the confusion, so use 'posts_path' for 'index' and 'post_path' for 'show'.  Just for clearity
	get '/posts/:id' => 'posts#show', as: 'post'

	delete '/posts/:id' => 'posts#destroy'

	#patch '/posts/:id' => 'posts#update'


	resources :posts, only: [:edit, :update] do
		resources :comments, :images
	end

end
