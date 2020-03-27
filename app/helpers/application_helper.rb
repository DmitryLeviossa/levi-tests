module ApplicationHelper

    def is_nav_active(link)
        controller.controller_name == link ? 'active' : ''
    end
end
