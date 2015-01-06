module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
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
        options:
          sourceMap: true
        cwd: 'assets/coffee/'
        src: ['**/*.coffee']
        dest: 'lib/public/js/'
        ext: '.js'
      compileServer:
        expand: true
        options:
          sourceMap: true
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: 'lib/'
        ext: '.js'
    
    copy:
      css:
        files: [{
          expand: true
          cwd: 'assets/css/'
          src: ['*.css']
          dest: 'lib/public/css/'
        }]
      html:
        files: [{
          expand: true
          cwd: 'assets/html/'
          src: ['*.html']
          dest: 'lib/public/'
        }]
      jade:
        files: [{
          expand: true
          cwd: 'src/views/'
          src: ['**/*.jade']
          dest: 'lib/views/'
        }]
      bower:
        files: [{
          expand: true
          flatten: true
          cwd: 'bower_components/' 
          src: [
            # 'jquery/dist/jquery.js',
          ]
          dest: 'lib/public/js/' 
        }]
    
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
    
  grunt.registerTask('build', ['coffee', 'copy'])
  grunt.registerTask('default', ['build', 'concurrent'])