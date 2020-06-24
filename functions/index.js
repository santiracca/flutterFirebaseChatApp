const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.myFunction = functions.firestore
  .document("chat/{message}")
  .onCreate((snapshot, context) => {
    admin.messaging().sendToTopic("chat", {
      notification: {
        title: snapshot.data().username,
        body: snapshot.data().text,
        clickAction: "FLUTTER_NOTIFICATION_CLICK",
      },
    });
  });
