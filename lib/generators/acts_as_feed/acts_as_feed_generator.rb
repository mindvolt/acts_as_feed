require 'rails/generators/active_record'

class PaperclipGenerator < ActiveRecord::Generators::Base
  desc "Create a migration to add a database table for the ActsAsFeed::Feed model"

  argument :table_name, :required => false, :type => :string, :desc => "An alternate table name, default is feeds",
           :banner => "table_name"

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def generate_migration
    migration_template "acts_as_feed_migration.rb.erb", "db/migrate/#{migration_file_name}"
  end

  protected

  def migration_name
    "create_acts_as_feed"
  end

  def migration_file_name
    "#{migration_name}.rb"
  end

  def migration_class_name
    migration_name.camelize
  end
end