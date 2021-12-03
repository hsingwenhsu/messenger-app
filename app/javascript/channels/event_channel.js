import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const event_element = document.getElementById('event-id');
  const event_id = event_element.getAttribute('data-event-id');

  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

consumer.subscriptions.create({ channel: "EventChannel", event_id: event_id}
, {
  connected() {
    console.log("connected to " + event_id)
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const admin_element = document.getElementById('admin-id');
    // const user_id = Number(user_element.getAttribute('data-user-id'));
    const admin_id = Number(admin_element.getAttribute('data-admin-id'));
    let html;
    if (admin_id === data.event_message.admin_id) {
      html = data.mine
    } else {
      html = data.theirs
    }
  
    const event_messageContainer = document.getElementById('messages')
    event_messageContainer.innerHTML = event_messageContainer.innerHTML + html
  }
});
