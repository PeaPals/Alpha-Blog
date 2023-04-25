import logo from './logo.svg';
import './App.css';

import { Home } from './views/pages';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';



import { NavBar } from './components/navbar';
function Tester() {
  return (
    <NavBar signedIn={true}/>
  )
}


function App() {
  return (
    <Router>
      <Routes>
        <Route path='/' exact element={<Home />} />
        <Route path='/testing' exact element={<Tester />} />
      </Routes>
    </Router>
  );
}

export default App;
