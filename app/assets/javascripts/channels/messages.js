
App.messages = App.cable.subscriptions.create('MessagesChannel', {

    received: function(data) {
        parent.postMessage(data, "*");
    },
    renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
});
