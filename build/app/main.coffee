window.App =
    Templates: {}
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    init: ->
        #Create event aggregator to coordinate main and sidebar views
        @eventAggregator = _.extend {}, Backbone.Events
        router = new @Routers.AppRouter

$(document).ready ->
    App.init()