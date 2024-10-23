import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

import ProjectStatusFormController from "../controllers/project_status_form_controller"
application.register("project-status-form", ProjectStatusFormController)

export { application }
