module.exports = {
    main: {
        files: [
            // Bootstrap Fonts
            {
                expand: true,
                cwd: "bower_components/bootstrap/dist/fonts/",
                src: "*",
                dest: "build/fonts/"
            }
        ]
    }
};