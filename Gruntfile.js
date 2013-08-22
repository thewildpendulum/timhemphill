module.exports = function(grunt) {
    grunt.initConfig({
        // Paths
        client: {
            coffee: ['build/app/**/*.coffee']
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

        // Run tests
        mocha: {
            all: ['test/*.html']
        },

        // Watch for updates
        watch: {
            files: ['<%= app.coffee %>', '<%= server.coffee %>'],
            tasks: 'coffee'
        }
    });

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-mocha');

    grunt.registerTask('default', ['coffee']);
    grunt.registerTask('dev', ['coffee', 'watch']);
};

// need to figure out what to do with app/ and public/. do i really need two?
// at least put coffee files somewhere to compile to somewhere else, right?