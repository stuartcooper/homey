import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["hideable"]

	connect() {
		console.log("Project Comments form controller connected")
	}

	reveal() {
		console.log('Reveal method called')
		this.hideableTargets.forEach(el => {
			el.classList.remove("hidden")
		});
	}
}
