# Set environment to development unless something else is specified
app_default_env = "production" # set production or staging
rails_env = ENV["RAILS_ENV"] || ENV['RACK_ENV'] || app_default_env
workers_number = ENV['APP_SERVER_COUNT'] || (rails_env == app_default_env ? 2 : 1)
system_user = "rails"
app_name = "droidcon-poland"
app_port = 3000

# Paths
app_dir = "/home/#{system_user}/#{app_name}"
stdout_path "#{app_dir}/shared/log/unicorn.stdout.log"
stderr_path "#{app_dir}/shared/log/unicorn.stderr.log"
pid "#{app_dir}/shared/tmp/pids/#{app_name}-unicorn.pid"

# Listening
listen app_port, :tcp_nopush => true
listen "#{app_dir}/shared/tmp/sockets/#{app_name}.sock", :backlog => 2048

# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
worker_processes workers_number.to_i

# Preload our app for more speed
preload_app true

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "#{app_dir}/current"

timeout 60

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{app_dir}/current/Gemfile"
end

before_fork do |server, worker|
  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  # Master doesn't need AR connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end
end

after_fork do |server, worker|
  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)

  # Slaves need AR connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end
end
