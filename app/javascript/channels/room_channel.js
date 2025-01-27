import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = room_element.getAttribute('data-room-id');

  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
    connected() {
      console.log("connected to " + room_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
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
    
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html
    }
  });
})
