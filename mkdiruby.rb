# frozen_string_literal: true

def check_if_user_gave_input
  abort('mkdir: missing input') if ARGV.empty?
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_lib_folder(folder_name)
  Dir.mkdir("#{folder_name}/lib")
end

def create_gem_file(folder_name)
  file = File.open("#{folder_name}/Gemfile", 'a')
  file.puts("source 'https://rubygems.org'")
  file.puts("
ruby '2.7.1'
gem 'rspec'
gem 'pry'
gem 'rubocop'
gem 'dotenv'")
  file.close
end

def create_gitignore_and_env_file(folder_name)
  file = File.open("#{folder_name}/.env", 'a')
  file.close
  file = File.open("#{folder_name}/.gitignore", 'a')
  file.puts('.env')
  file.close
end

def command_init(folder_name)
  Dir.chdir(folder_name.to_s) do
    system('git init')
    system('bundle install')
    system('rspec --init')
  end
end

def create_read_me_file(folder_name)
  file = File.open("#{folder_name}/Readme.md", 'a')
  file.puts('Ceci est un programme Ruby')
  file.close
end

def command_git(folder_name)
  Dir.chdir(folder_name.to_s) do
    system('git add .')
    system('git commit -m "first commit"')
  end
end

def create_app_rb_file(folder_name)
  file = File.open("#{folder_name}/lib/app.rb", 'a')
  file.puts('Hello mon boug !')
  file.close

  file = File.open("#{folder_name}/spec/app_spec.rb", 'a')
  file.puts("Hey mon boug, n'oublies pas tes specs !")
  file.close
end

def get_folder_name
  check_if_user_gave_input
  folder_name = ARGV.first
  create_folder(folder_name)
  create_gem_file(folder_name)
  create_gitignore_and_env_file(folder_name)
  create_lib_folder(folder_name)
  command_init(folder_name)
  create_read_me_file(folder_name)
  create_app_rb_file(folder_name)
  command_git(folder_name)
end

get_folder_name

# alias mkdiruby="ruby /Users/david_sfy/Desktop/THP/mkdiruby.rb"
