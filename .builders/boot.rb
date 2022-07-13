# frozen_string_literal: true

# Boot Sequence

include KLog::Logging

CONFIG_KEY = :cmdlet

log.kv 'working folder', Dir.pwd

KConfig.configure do |config|
  config.handlebars.defaults.add_array_defaults
  config.handlebars.defaults.add_case_defaults
  config.handlebars.defaults.add_comparison_defaults
  config.handlebars.defaults.add_inflection_defaults
end

def k_builder
  @k_builder ||= KBuilder::BaseBuilder.init(KConfig.configuration(CONFIG_KEY))
end

KConfig.configure(CONFIG_KEY) do |config|
  builder_folder    = Dir.pwd
  base_folder       = File.expand_path('../', builder_folder)
  global_template   = File.expand_path('~/dev/kgems/k_templates/templates')
  handlebars_folder = File.expand_path('~/dev/kgems/handlebarsjs/')

  config.template_folders.add(:global_template    , global_template)
  config.template_folders.add(:template           , File.expand_path('.templates', Dir.pwd))

  config.target_folders.add(:app                  , base_folder)
  config.target_folders.add(:lib                  , :app, 'lib/cmdlet')
  config.target_folders.add(:spec                 , :app, 'spec/cmdlet')
  config.target_folders.add(:builder              , builder_folder)
  config.target_folders.add(:builder_data         , :builder, 'data')
  config.target_folders.add(:handlebars           , handlebars_folder)
  config.target_folders.add(:handlebars_lib       , :handlebars, 'lib')
  config.target_folders.add(:handlebars_spec      , :handlebars, 'spec')
end

KConfig.configuration(CONFIG_KEY).debug

area = KManager.add_area(CONFIG_KEY)
resource_manager = area.resource_manager
resource_manager
  .fileset
  .glob('*.rb', exclude: ['boot.rb'])
  .glob('documents/**/*.rb')
  .glob('generators/**/*.rb')
resource_manager.add_resources

KManager.boot
