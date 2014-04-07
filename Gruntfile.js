module.exports = function(grunt) {

    // Constants

    // Project Config
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: require("./tasks/clean"),
        copy: require("./tasks/copy"),
        coffee: require("./tasks/coffee.js"),
        jade: require("./tasks/jade.js"),
        concat: require("./tasks/concat.js"),
        useminPrepare: require("./tasks/useminPrepare.js"),
        usemin: require("./tasks/usemin.js"),
        watch: require("./tasks/watch.js")
    });

    // Dependencies
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-usemin');

    // Tasks
    grunt.registerTask('default', [
        "clean:build",
        "copy",
        "concat",
        "coffee",
        "jade",
        "useminPrepare",
        "usemin",
        "watch"
    ]);

};
