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
        concat: {
            options: {
                separator: ';',
            },
            dist: {
                src: './build/**/*.js',
                dest: './dist/algorithms.coffee.js',
            },
        },
        uglify: {
            my_target: {
                files: {
                    './dist/algorithms.coffee.min.js': './dist/algorithms.coffee.js'
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
            'concat',
            'uglify'
        ]
    );


    grunt.loadNpmTasks('grunt-mkdir');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-mocha-test');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');

};
