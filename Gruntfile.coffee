module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-nodemon'
  
  grunt.initConfig
    watch:
      coffeeAssets:
        files: 'assets/coffee/*.coffee'
        tasks: ['coffee:compileAssets']
      coffeeServer:
        files: 'src/*.coffee'
        tasks: ['coffee:compileServer']
      jade:
        files: 'src/views/*.jade'
        tasks: ['jade:compileServer']
    
    coffee:
      compileAssets:
        expand: true
        # flatten: true
          options:
            sourceMap: true
          cwd: 'assets/coffee/'
          src: ['**/*.coffee']
          dest: 'lib/public/js/'
          ext: '.js'
      compileServer:
        expand: true
        # flatten: true
        options:
          sourceMap: true
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: 'lib/'
        ext: '.js'
    
    jade:
      compileServer:
        expand: true
        # flatten: true
        options:
          sourceMap: true
        cwd: 'src/views'
        src: ['**/*.jade']
        dest: 'lib/views'
        ext: '.html'
      
    nodemon:
      dev:
        script: 'lib/server.js'
        watch: 'lib'
        ext: '*'
        options:
          nodeArgs: ['--debug']
    
    concurrent:
      dev:
        tasks: ['nodemon', 'watch']
        options:
          logConcurrentOutput: true
    
  grunt.registerTask('build', ['coffee', 'jade', 'copy'])
  grunt.registerTask('default', ['build', 'concurrent'])