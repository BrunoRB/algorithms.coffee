module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),

        mkdir: {
            all: {
                create: 'build'
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
            app: ['./src/**/*.coffee', './test/**/*.coffee'],
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
        }
    });

    // Default task(s).
    grunt.registerTask(
        'default',
        [
            'mkdir',
            'coffee',
            'coffeelint',
            'mochaTest'
        ]
    );


    grunt.loadNpmTasks('grunt-mkdir');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-mocha-test');

};
