App.Views.BlogView = Backbone.View.extend
	el: $('#view')

	template: _.template """
		<% _.each(posts, function(post) { %>
			<div class="post" id="<%= post.name %>">
				<h2> <%= post.title %> </h2>
				<p> <%= post.preview %> </p>
				<p> <a href="/blog/<%= post.name %>"> Read more... </a> </p>
				<span> <%= post.dateCreated %> </span>
				<span> <%= post.tags %> </span>
			</div>
		<% }); %>

		<div class="sideView">
			<ul>
				<% _.each(tags, function(tag) { %>
					<li class="tag" id="<%= tag.name %>"> <%= tag.name %> </li>
				<% }); %>
			</ul>
		</div>
	"""

	initialize: ->
		_.bindAll @
		# @posts = App.Collections.Posts.fetch()
		@posts = new App.Collections.Posts [{ 
						name: "post-1",
						title: "post 1",
						body: "this is my first blog post. woo!",
						preview: "this is my first",
						tags: ["eating", "fire"],
						dateCreated: "11/3/2012 4:37PM"
					}, {
						name: "post-2",
						title: "post 2",
						body: "this is my second blog post. woo!",
						preview: "this is my second",
						tags: ["kittens", "eating"],
						dateCreated: "11/3/2012 4:39PM"
					}]

		# @tags = App.Collections.Tags.fetch()
		@tags = new App.Collections.Tags [{name: 'fire'}, {name: 'kittens'}, {name: 'eating'}]

		#Keep track of tags to filer on and render the view
		#with filtered posts when activeTags changes
		@activeTags = new App.Collections.Tags
		@activeTags.bind 'add remove', @render
		
		@render()

	render: ->
		@$el.append 'blog view'
		@$el.html @template
						posts: @posts.filter @activeTags.pluck 'name'
						tags: @tags.toJSON()
		@

	filterPosts: (e) ->
		tag = @tags.findOne name: e.srcElement.id

		if @activeTags.has tag
			@activeTags.remove tag
		else
			@activeTags.add tag

	events:
		'click .tag': 'filterPosts'
