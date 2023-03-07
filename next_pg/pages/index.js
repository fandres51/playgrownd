import Header from '../components/Header'
import React from 'react';
import { db } from '../firebase/index';
import { collection, getDocs } from "firebase/firestore";
import TutorialCard from '../components/TutorialCard';

export default function Home() {

  let [animes, setAnimes] = React.useState([]);

  let getAnimes = async () => {
    let animesToPush = [];
    const querySnapshot = await getDocs(collection(db, "animes"));
    querySnapshot.forEach((doc) => {
      animesToPush.push(doc.data())
    });
    setAnimes(animesToPush);
  }

  React.useEffect(() => {
    getAnimes();
  }, []);

  return (
    <div>
      <Header></Header>
      <div style={{
        padding: 20,
        backgroundColor: '#f5f5f5',
        color: 'black',
      }}>
        <h1>Tutorial Requests</h1>
        <div>
          {
            animes.map((anime) => {
              return <div key={anime.name}>
                <TutorialCard name={anime.name} number={anime.num_episodes}></TutorialCard>
              </div>
            })
          }
        </div>
      </div>
    </div>
  )
}
