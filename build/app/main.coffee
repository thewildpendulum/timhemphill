window.App =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    init: ->
        #Create event aggregator to coordinate main and sidebar views
        @eventAggregator = _.extend {}, Backbone.Events
        router = new @Routers.AppRouter

        #Configure pushState routing
        Backbone.history.start pushState: true
        $(document).on 'click', 'a[href]:not([data-bypass])', (e) ->
            href = $(this).attr 'href'
            protocol = "#{ location.protocol }//"
            console.log "href: #{ href }, protocol: #{ protocol }"

            if href.slice protocol.length isnt protocol.length
                e.preventDefault()
                Backbone.history.navigate href, true

$(document).ready ->
    App.init()