def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_lib_folder(folder_name)
  Dir.mkdir("#{folder_name}/lib")
end

def create_gem_file(folder_name)
  file = File.open("#{folder_name}/Gemfile", "a")
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
  file = File.open("#{folder_name}/.env", "a")
  file.close
  file = File.open("#{folder_name}/.gitignore", "a")
  file.puts(".env")
  file.close
end

def command(folder_name)
  Dir.chdir("#{folder_name}") {
    system("git init")
    system("bundle install")
    system("rspec --init")
   }
end

def create_read_me_file(folder_name)
  file = File.open("#{folder_name}/Readme.md", "a")
  file.puts("Ceci est un programme Ruby")
  file.close
end

def get_folder_name
  check_if_user_gave_input
  folder_name = ARGV.first
  create_folder(folder_name)
  create_gem_file(folder_name)
  create_gitignore_and_env_file(folder_name)
  create_lib_folder(folder_name)
  command(folder_name)
  create_read_me_file(folder_name)
end
#
get_folder_name

#alias mkdiruby="ruby /Users/david_sfy/Desktop/THP/mkdiruby.rb"
