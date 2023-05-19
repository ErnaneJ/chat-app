import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset() {
    this.element.reset();
    setTimeout(()=>this.scrollToBottom(), 50);
  }

  scrollToBottom() {
    const messagesContainer = document.getElementById('messages');
    if(!messagesContainer) return;
    messagesContainer.scrollTo(0, messagesContainer.scrollHeight, { behavior: 'smooth' });
  }
}