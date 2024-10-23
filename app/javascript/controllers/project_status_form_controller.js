import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["newCommentForm"]
	connect() {
		console.log("Project status form controller connected")
	}

	submit() {
		const form = this.element.closest("form")
		console.log(form)
		if (form) {
			form.submit()
		} else {
			console.error("Form element not found!")
		}
	}
}
