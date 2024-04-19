import consumer from "channels/consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("Connected to message channel......")
  },

  disconnected() {
    console.log("Dissconnected to message channel....")
  },

  received(data) {
    const currentTopicId = window.location.pathname.split("/").pop();
    const receivedTopicId = data.topic_id;
    if (currentTopicId == receivedTopicId) {
      if (data.method == "add"){
        displayMessage(data)
      }
      else if (data.method == "remove"){
        removeMessage(data)
      }
    }
  }
});

function displayMessage(data) {
  console.log("Received message:", data);
  const messageHTML = `
    <div class="message" data-message-id=${data.message_id}>
      <p><strong>From:</strong> ${data.user_email}</p>
      <p><strong>Content:</strong> ${data.text}</p>
    </div>
  `;
  document.getElementById('messagesId').insertAdjacentHTML('afterbegin', messageHTML);
}

function removeMessage(data){
  const messageId = data.message_id;
  const messageElement = document.querySelector(`.message[data-message-id="${messageId}"]`);
  messageElement.remove();
}