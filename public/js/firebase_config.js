// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
var firebaseConfig = {
 apiKey: "AIzaSyBbjOH5lpYuFqcuas9dRY-QrHVETYgLvXA",
  authDomain: "tutor-dd873.firebaseapp.com",
  projectId: "tutor-dd873",
  storageBucket: "tutor-dd873.appspot.com",
  messagingSenderId: "535512934086",
  appId: "1:535512934086:web:2886993ec4931eeae8d9c7",
  measurementId: "G-C119FQTB6E"

};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
var URL = $('meta[name="baseURL"]').attr('content');

console.log("Firebase started.");

// Facebook
var facebookProvider = new firebase.auth.FacebookAuthProvider();

var googleProvider = new firebase.auth.GoogleAuthProvider();