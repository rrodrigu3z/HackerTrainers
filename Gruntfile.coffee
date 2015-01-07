module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-nodemon'
  
  grunt.initConfig
    watch:
      coffeeAssets:
        files: 'assets/coffee/**/*.coffee'
        tasks: ['coffee:compileAssets']
      coffeeServer:
        files: 'src/**/*.coffee'
        tasks: ['coffee:compileServer']
      jadeServer:
        files: 'src/views/**/*.jade'
        tasks: ['copy:jade']
      
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
    
    stylus:
      compileAssets:
        expand: true
        options:
          sourceMap: true
        cwd: 'assets/stylesheets/'
        src: ['**/*.styl']
        dest: 'lib/public/css/'
        ext: '.css'
    
    bower:
      install:
        options:
          targetDir: 'assets/vendor'
          layout: 'byComponent'
          
    copy:
      css:
        files: [{
          expand: true
          flatten: true
          cwd: 'assets/'
          src: ['**/*.css']
          dest: 'lib/public/css/'
        }]
      js:
        files: [{
          expand: true
          flatten: true
          cwd: 'assets/'
          src: ['**/*.js']
          dest: 'lib/public/js/'
        }]
      fonts:
        files: [{
          expand: true
          flatten: true
          cwd: 'assets/'
          src: ['**/*.eot', 'vendor/bootstrap/*.svg', '**/*.ttf', '**/*.woff']
          dest: 'lib/public/fonts/'
        }]
      html:
        files: [{
          expand: true
          cwd: 'assets/'
          src: ['**/*.html']
          dest: 'lib/public/'
        }]
      jade:
        files: [{
          expand: true
          cwd: 'src/views/'
          src: ['**/*.jade']
          dest: 'lib/views/'
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
    
  grunt.registerTask('build', ['coffee', 'stylus', 'copy'])
  grunt.registerTask('default', ['build', 'concurrent'])