import Reflux        from 'reflux'
import messagesStore from '../stores/messagesStore'

const Messages = React.createClass({
  mixins: [Reflux.connect(messagesStore, 'messages')],

  render() {
    const messages = this.state.messages.map((message) => {
      return <div key={message.id}>{message.body}</div>
    })
    return (
      <div>
        {messages}
      </div>
    )
  }
})

export default Messages
