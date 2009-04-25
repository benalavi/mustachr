after "deploy:symlink", "deploy:symlink_configs"
after "deploy:setup", "provision:setup"

namespace :deploy do  
  desc "Start the app"
  task :start, :roles => :app do
    sudo "a2ensite #{vhost}"
    sudo "/etc/init.d/apache2 reload"
  end

  desc "Stop the app"
  task :stop, :roles => :app do
    sudo "a2dissite #{vhost}"
    sudo "/etc/init.d/apache2 reload"
  end
  
  desc "Restart the app"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Symlink config files & assets"
  task :symlink_configs, :roles => :app, :except => { :no_symlink => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"
  end
end

namespace :application do
  desc "Tail the Rails log for this environment"
  task :tail, :roles => :app do
    do_tail "#{shared_path}/log/#{rails_env}.log"
  end
end

def do_tail(log, via_sudo=false)
  via_sudo ? sudo("tail -f #{log}") : run("tail -f #{log}") do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:server]}: #{data}"
    break if stream == :err    
  end
end
