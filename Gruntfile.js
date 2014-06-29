module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
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
			'mochaTest'
        ]
    );

    grunt.loadNpmTasks('grunt-mocha-test');

};
