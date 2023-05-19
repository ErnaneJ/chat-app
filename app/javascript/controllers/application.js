import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('turbo:load', () => {
  const messagesContainer = document.getElementById('messages');
  messagesContainer.scrollTo(0, messagesContainer.scrollHeight + 99999999999, { behavior: 'smooth' });
})
