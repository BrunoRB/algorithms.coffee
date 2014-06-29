module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		mocha: {
            test: {
                files: ['test/**/*.coffee'],
                options: {
                    reporter: 'Nyan',
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-mocha');

    // Default task(s).
    grunt.registerTask(
        'default',
        [
			'mocha'
        ]
    );

};
