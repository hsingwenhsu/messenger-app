import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('privates-room-id');
  const room_id = room_element.getAttribute('data-privates-room-id');

  console.log(consumer.subscriptions)

consumer.subscriptions.create({ channel: "PrivatesChannel", privates_room_id: privates_room_id }, {
  connected() {
    console.log("connected to " + privates_room_id)
    // Called when the subscription is ready for use on the server
  },

  disconnected()  {
    // const user_element = document.getElementById('user-id');
    const admin_element = document.getElementById('admin-id');
    // const user_id = Number(user_element.getAttribute('data-user-id'));
    const admin_id = Number(admin_element.getAttribute('data-admin-id'));
    let html;
    if (admin_id === data.message.admin_id) {
      html = data.mine
    } else {
      html = data.theirs
    }
  
    const messageContainer = document.getElementById('private_messages')
    messageContainer.innerHTML = messageContainer.innerHTML + html
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
