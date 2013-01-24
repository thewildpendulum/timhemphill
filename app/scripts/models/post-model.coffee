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


App.Collections.Posts = Backbone.Collection.extend
    model: App.Models.Post

    url: 'api/posts'

    filterByTags: (tags) ->
        console.log tags
        if tags.length > 0
            _.filter @toJSON(), (post) ->
                # console.log """
                #   tags: #{tags.length}
                #   posts: #{post.tags.length}
                #   intersection: #{(_.intersection tags, post.tags).length}
                # """
                #this function checks if the selected tags are in the post
                #Since _.intersection returns an array of elements that both
                #arrays share, we know whether each post contains all tags
                #if the intersection is as long as the tags array
                (_.intersection tags, post.tags).length is tags.length
        else
            @toJSON()

    findOne: (query) ->
        result = @.where(query)
        result[0]

    has: (model) ->
        (m for m in @models when m is model).length
