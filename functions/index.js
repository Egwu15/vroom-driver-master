const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();

const firestore = admin.firestore();

exports.onUserStatusChange = functions.database
    .ref("/{id}/isLoggedIn")
    .onUpdate((change, context) => {
      // Get the data written to Realtime Database
      const isOnline = change.after.val();

      // Get a reference to the Firestore document
      const userStatusFirestoreRef=
      firestore.doc(`users/${context.params.id}`);

      console.log(`status: ${isOnline}`);

      // Update the values on Firestore
      return userStatusFirestoreRef.update({
        isLoggedIn: isOnline,
        //   last_seen: Date.now(),
      });
    });

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

