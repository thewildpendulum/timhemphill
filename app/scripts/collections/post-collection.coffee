App.Collections.Posts = Backbone.Collection.extend
	model: App.Models.Post

	filterByTags: (tags) ->
		console.log tags
		if tags.length > 0
			_.filter @toJSON(), (post) ->
				# console.log """
				# 	tags: #{tags.length}
				# 	posts: #{post.tags.length}
				# 	intersection: #{(_.intersection tags, post.tags).length}
				# """
				#this function checks to see if the selected tags are in the post
				#Since _.intersection returns an array of elements that both
				#arrays share, we know whether each post contains all tags
				#if the intersection is as long as the tags array
				(_.intersection tags, post.tags).length is tags.length
		else
			@toJSON()

	has: (model) ->
		(m for m in @models when m is model).length
