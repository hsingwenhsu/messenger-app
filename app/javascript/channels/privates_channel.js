import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('privates-room-id');
  const private_id = room_element.getAttribute('data-privates-room-id');
  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "PrivatesChannel", private_id: private_id }, {
    connected() {
      console.log("connected to " + private_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      console.log("hihihihihihihihihihi")
      // const user_element = document.getElementById('user-id');
      const admin_element = document.getElementById('admin-id');
      // const user_id = Number(user_element.getAttribute('data-user-id'));
      const admin_id = Number(admin_element.getAttribute('data-admin-id'));
      console.log(admin_id)
      let html;
      if (admin_id === data.private_message.admin_id) {
        html = data.mine
      } else {
        html = data.theirs
      }
    
      const messageContainer = document.getElementById('private_messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html
    }
  });
})
