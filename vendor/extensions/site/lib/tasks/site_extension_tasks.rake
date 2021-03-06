namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(SiteExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      say fixture_file + ' is the current file'
      Fixtures.create_fixtures("#{SiteExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end

  desc "Bootstrap your database for Spree - w/o invoking Spree gem bootstrap and loading the fixture files there"
  task :site_bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    Rake::Task["db:remigrate"].invoke

    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    require 'custom_fixtures'
    Dir.glob(File.join(SiteExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      say fixture_file + ' is the current file'
      Fixtures.create_fixtures("#{SiteExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
end

namespace :spree do
  namespace :extensions do
    namespace :site do
      desc "Copies public assets of the Site to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[SiteExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(SiteExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
