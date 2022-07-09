# frozen_string_literal: true

KManager.action :commands_bak do
  action do
    puts commands.first.function_description
    # Ruby Gem Bootstrap
    director = KDirector::Dsls::BasicDsl
               .init(k_builder,
                     template_base_folder: '',
                     on_exist: :skip, # %i[skip write compare]
                     on_action: :queue # %i[queue execute]
                    )
               .blueprint(
                 active: true,
                 name: :build_commands,
                 description: 'Build Commandlets',
                 on_exist: :write
               ) do
      cd(:lib)

      # builder
      #   .add_file('FUNCTIONS.md',
      #             template_file: 'FUNCTIONS.md',
      #             categories: categories.sort_by { |r| r.name },
      #             functions: functions.sort_by { |r| [r.category, r.name] },
      #             on_exist: :write)

      add('all_commands.rb',
          template_file: 'all_commands.rb',
          commands: commands.sort_by { |r| [r.category, r.name] },
          on_exist: :write)

      cmdlets.each do |cmdlet|
        add("#{cmdlet.category}/#{cmdlet.name}.rb",
            cmdlet: cmdlet,
            template_file: 'command.rb',
            on_exist: :write)
      end
    end

    director.play_actions
    # director.builder.logit
  end
end

KManager.opts.app_name                    = 'commands'
KManager.opts.sleep                       = 2
KManager.opts.reboot_on_kill              = 0
KManager.opts.reboot_sleep                = 4
KManager.opts.exception_style             = :short
KManager.opts.show.time_taken             = true
KManager.opts.show.finished               = true
KManager.opts.show.finished_message       = 'FINISHED :)'
