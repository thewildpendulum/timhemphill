module.exports = function(grunt) {
    grunt.initConfig({

        // Lint CoffeeScript files
        coffeelint: {
            app: ['app/scripts/**/*.coffee', 'server/**/*.coffee'] //add tests
        },
        coffeelintOptions: {
            'indentation': {
                'value': 4,
                'level': 'error'
            },
            'no_tabs': {
                'level': 'error'
            },
            'max_line_length': {
                'value': 80,
                'level': 'error'
            },
            'no_trailing_whitespace': {
                'level': 'error'
            }
        },

        // Compile CoffeeScript files
        coffee: {
            app: {
                src: ['app/scripts/**/*.coffee'],
                dest: 'public/scripts/',
                options: {
                    preserve_dirs: true
                }
            },
            server: {
                src: ['server/**/*.coffee'],
                dest: './'
            },
        },

        // Run tests
        mocha: {
            all: ['test/index.html']
        },

        // Watch for updates
        watch: {
            files: '<config:coffee.app.src>',
            tasks: 'coffeelint coffee'
        }
    });

    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-coffee');
    grunt.loadNpmTasks('grunt-mocha');

    grunt.registerTask('default', 'coffeelint coffee watch');
};

// need to figure out what to do with app/ and public/. do i really need two?
// at least put coffee files somewhere to compile to somewhere else, right?