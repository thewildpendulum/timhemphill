App.Models.Tag = Backbone.Model.extend
	idAttribute: '_id'

	urlRoot: 'api/tags'

	defaults:
		name: ''