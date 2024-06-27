import firebase from 'firebase/compat/app'
import "firebase/compat/firestore";

import { getDatabase } from 'firebase/database'

const firebaseConfig = {
  apiKey: "AIzaSyCBAU1qcc-VEC441tEghLDnT1ARGP926YI",
  authDomain: "esp32-firebase-demo-1866a.firebaseapp.com",
  databaseURL: "https://esp32-firebase-demo-1866a-default-rtdb.firebaseio.com",
  projectId: "esp32-firebase-demo-1866a",
  storageBucket: "esp32-firebase-demo-1866a.appspot.com",
  messagingSenderId: "907525762441",
  appId: "1:907525762441:web:4f54c7632f912e17588558"
};

  if (firebase.apps.length === 0){
    firebase.initializeApp(firebaseConfig);
  }

  const db = getDatabase();
  export { db }