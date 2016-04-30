module KarmaHrmDiscussion
  class Engine < ::Rails::Engine
    if defined?(ActsAsPluggable)
      ::ActsAsPluggable::Plugin.register(
        :karmahrm_discussion,
        :collaboration, engine: self,
                        description: 'Discussion Plugin',
                        website: 'https://github.com/tachyons/karmahrm_discussion',
                        author: 'Aboobacker MK',
                        version: KarmaHrmDiscussion::VERSION,
                        settings: {
                          display_in_topbar: true
                        },
                        menu: {
                          url: {
                            controller: :posts,
                            action: :index
                          },
                          class: 'fa fa-discussion',
                          submenus: [
                            {
                              text: 'New',
                              class: 'fa fa-new',
                              url: { controller: :posts, action: :new }
                            },
                            {
                              text: 'Index',
                              class: 'fa fa-index',
                              url: { controller: :posts, action: :index }
                            }
                          ],
                          text: 'Discussions'
                        })
    end
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.active_record.observers ||= []
    config.active_record.observers << 'PostObserver'
    config.active_record.observers << 'PostCommentObserver'
  end
end
