module.exports = function(grunt) {
    grunt.initConfig({
        // Paths
        client: {
            coffee: ['build/app/**/*.coffee'],
            hbs: ['build/app/templates/*.hbs']
        },
        server: {
            coffee: ['build/server/*.coffee']
        },

        // Compile CoffeeScript files
        coffee: {
            app: {
                src: '<%= client.coffee %>',
                dest: 'public/scripts/app.js',
                options: {
                    sourceMap: true
                }
            },
            server: {
                src: '<%= server.coffee %>',
                dest: 'server.js'
            }
        },

        // Compile Handlebars templates
        handlebars: {
            carbon: {
                options: {
                    namespace: "App.Templates",
                    processName: function(filename) {
                        var path = filename.split("/");
                        var file = path[path.length-1];
                        return file.split(".")[0];
                    }
                },
                files: {
                    'public/scripts/templates.js': '<%= client.hbs %>'
                }
            }
        },

        // Run tests
        mocha: {
            all: ['test/*.html']
        },

        // Watch for updates
        watch: {
            files: ['<%= app.coffee %>', '<%= server.coffee %>'],
            tasks: ['coffee', 'handlebars']
        }
    });

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-mocha');

    grunt.registerTask('default', ['coffee', 'handlebars']);
    grunt.registerTask('dev', ['coffee', 'handlebars','watch']);
};
