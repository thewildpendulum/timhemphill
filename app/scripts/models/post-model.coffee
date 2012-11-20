App.Models.Post = Backbone.Model.extend
	idAttribute: '_id'

	urlRoot: 'api/posts'

	defaults:
		name: ''
		title: ''
		body: ''
		# preview: ''
		dateCreated: ''
		tags: []

	dashify: (text) ->
		#Replace any spaces in the string with dashes for post url and id
		text.replace /\s+/g, '-'

	push: (attr, val) ->
		arr = @get attr
		arr.push val
		@set attr, arr

	remove: (attr, val) ->
		arr = @get attr
		@set attr, _.without arr, val