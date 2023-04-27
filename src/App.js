import './App.css';

import 'bootstrap/dist/js/bootstrap';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';

import { NavBar } from './components';
import { Home } from './views/pages';
import { NewArticle, EditArticle, ShowArticle, ShowArticles } from './views/articles';


function Tester() {
  return (
    <NewArticle />
  )
}


function App() {
  return (
    <Router>
      <NavBar signedIn={true}/>

      <Routes>
        <Route path='/testing' exact element={<Tester />} />
        <Route path='/' exact element={<Home />} />

        {/* Articles Routes */}
        <Route path='/articles' exact element={<ShowArticles />} />
        <Route path='/articles/:id' exact element={<ShowArticle />} />
        <Route path='/articles/new' exact element={<NewArticle />} />
        <Route path='/articles/:id/edit' exact element={<EditArticle />} />
      </Routes>
    </Router>
  );
}

export default App;
