module.exports = {
    compile: {
        expand: true,
        cwd: "app/",
        src: ['**/*.coffee'],
        dest: 'build/',
        ext: '.js'
    }
};
