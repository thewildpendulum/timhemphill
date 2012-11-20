App.Collections.Tags = Backbone.Collection.extend
	model: App.Models.Tag

	url: 'api/tags'

	findOne: (query) ->
		result = @.where(query)
		result[0]

	has: (model) ->
		(m for m in @models when m is model).length