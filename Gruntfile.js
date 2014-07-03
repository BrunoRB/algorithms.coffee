module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),

        mkdir: {
            all: {
                create: ['dist', 'build']
            },
        },
        coffee: {
            all: {
                expand: true,
                bare: true,
                cwd: './src/',
                src: '**/*.coffee',
                dest: './build',
                ext: '.js'
            }
        },
        coffeelint: {
            app: ['./src/**/*.coffee', './test/**/*.coffee', './*.coffee'],
            options: {
                configFile: 'coffeelint.json'
            }
        },
		mochaTest: {
            test: {
                options: {
                    reporter: 'spec',
                },
                require: [
                    'coffee-script/register'
                ],
                src: ['./test/**/*.coffee']
            }
        },
        uglify: {
            my_target: {
                files: {
                    './dist/algorithms.coffee.min.js': './build/**/*.js'
                }
            }
        }
    });

    // Default task(s).
    grunt.registerTask(
        'default',
        [
            'mkdir',
            'coffee',
            'coffeelint',
            'mochaTest',
            'uglify'
        ]
    );


    grunt.loadNpmTasks('grunt-mkdir');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-mocha-test');
    grunt.loadNpmTasks('grunt-contrib-uglify');

};
