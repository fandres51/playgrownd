import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
// replace this firebase conFigvariable with your own
const firebaseConfig = {
    apiKey: "AIzaSyDpgn9LbiWKdBs2X2_GSqagD5yDrjTqtes",
    authDomain: "playground-a2995.firebaseapp.com",
    projectId: "playground-a2995",
    storageBucket: "playground-a2995.appspot.com",
    messagingSenderId: "728018829710",
    appId: "1:728018829710:web:3f067786a96ce04e2264df",
    measurementId: "G-G8WZQ24067"
};
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app);
export { auth, db };