App.Routers.AppRouter = Backbone.Router.extend
    initialize: ->
        _.bindAll @
        # post1 = new App.Models.Post
        # 					name: "post-1",
        # 					title: "post 1",
        # 					body: "this is my first blog post. woo!",
        # 					tags: ["eating", "fire"],
        # 					dateCreated: "11/3/2012 4:37PM"
        # post2 = new App.Models.Post
        # 					name: "post-2",
        # 					title: "post 2",
        # 					body: "this is my second blog post. woo!",
        # 					tags: ["kittens", "eating"],
        # 					dateCreated: "11/3/2012 4:39PM"
        App.posts = new App.Collections.Posts
        # App.posts.add [post1, post2]

        App.posts.fetch
            success: (col, res, opts) =>
                @mainView = new App.Views.BlogView posts: col

        # tag1 = new App.Models.Tag name: 'fire'
        # tag2 = new App.Models.Tag name: 'eating'
        # tag3 = new App.Models.Tag name: 'kittens'
        App.tags = new App.Collections.Tags
        # App.tags.add [tag1, tag2, tag3]

        App.tags.fetch
            success: (col, res, opts) =>
                @sideView = new App.Views.TagsView tags: col

    routes:
        '':                 'blog'
        'blog':             'blog'
        'blog/:name':       'post'
        'admin/new':        'new'
        'admin/edit/:name': 'edit'

    blog: ->
        # detach events from previous views
        App.eventAggregator.off()

        @mainView = new App.Views.BlogView posts: App.posts
        @sideView = new App.Views.TagsView tags: App.tags

    post: (name) ->
        # detach events from previous views
        App.eventAggregator.off()

        post = App.posts.findOne name: name
        @mainView = new App.Views.PostView post: post
        @sideView = new App.Views.ActionsView postName: post.get 'name'

    new: ->
        # detach events from previous views
        App.eventAggregator.off()

        entry = new App.Models.Post
        @mainView = new App.Views.EntryView entry: entry
        @sideView = new App.Views.TagsView tags: App.tags

    edit: (name) ->
        # detach events from previous views
        App.eventAggregator.off()

        entry = App.posts.findOne name: name
        @mainView = new App.Views.EntryView entry: entry
        @sideView = new App.Views.TagsView tags: App.tags
        