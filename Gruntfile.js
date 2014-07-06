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
                banner: license,
                stripBanners: true
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
                },
                options: {
                    banner: licenseHeader + '**/\n'
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

    // Minimized task(s).
    grunt.registerTask(
        'minimized',
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
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');

};

var licenseHeader = '/**\
    The MIT License (MIT)\n\
    Copyright (c) 2014 Bruno Roberto Búrigo and Tayllan Búrigo\n\
    https://github.com/BrunoRB/algorithms.coffee';

var license = licenseHeader + '\n\n\
    Permission is hereby granted, free of charge, to any person obtaining a copy\n\
    of this software and associated documentation files (the "Software"), to deal\n\
    in the Software without restriction, including without limitation the rights\n\
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\n\
    copies of the Software, and to permit persons to whom the Software is\n\
    furnished to do so, subject to the following conditions:\n\
    The above copyright notice and this permission notice shall be included in all\n\
    copies or substantial portions of the Software.\n\
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n\
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\n\
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\n\
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\n\
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\n\
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\n\
    SOFTWARE.\n**/\n';
