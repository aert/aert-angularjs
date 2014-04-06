
module.exports = (grunt) ->

    # Constants


    # Project Config
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        clean:
            build: ["build"]
            all: ["build", "bower_components", "node_modules"]
        copy:
            main:
                files: [
                    # Bootstrap
                    {
                        expand: true,
                        cwd: "bower_components/bootstrap/dist/fonts/"
                        src: "*"
                        dest: "build/fonts/"
                    }
                ]
        coffee:
            compile:
                expand: true
                cwd: "app/"
                src: ['**/*.coffee']
                dest: 'build/'
                ext: '.js'
        jade:
            compile:
                files: [
                    {
                        expand: true
                        cwd: "app/"
                        src: ['**/*.jade']
                        dest: 'build/'
                        ext: '.html'
                    }
                ]
        concat:
            js_base:
                src: [
                    "bower_components/jquery/dist/jquery.min.js",
                    "bower_components/angular/angular.min.js",
                    "bower_components/bootstrap/dist/js/bootstrap.min.js"
                ]
                dest: "build/js/base.min.js"
            css_base:
                src: [
                    "bower_components/bootstrap/dist/css/bootstrap.min.css"
                ]
                dest: "build/css/base.min.css"
        watch:
            coffee:
                files: ["app/**/*.coffee"]
                tasks: "coffee:compile"
            jade:
                files: ["app/**/*.jade"]
                tasks: "jade:compile"


    # Dependencies
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    # Tasks
    grunt.registerTask 'default', [
        "clean:build", "copy", "concat"
        "coffee", "jade", "watch"
    ]
