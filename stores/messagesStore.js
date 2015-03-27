import Reflux from 'reflux'

const localStorageKey = 'messages'

const messagesStore = Reflux.createStore({
  getInitialState() {
    const loadedMessages = localStorage[localStorageKey]

    if (!loadedMessages) {
      this.messages = [{
        id: 0,
        body: 'hey yeah!'
      },
      {
        id: 1,
        body: 'another message'
      },
      {
        id: 4,
        body: 'sherpa'
      }]
    } else {
      this.messages = JSON.parse(loadedMessages)
    }

    return this.messages;
  }
})

export default messagesStore
