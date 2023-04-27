import './App.css';

import 'bootstrap/dist/js/bootstrap';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';

import { NavBar } from './components';
import { Home } from './views/pages';
import { Login, Signup, EditAccount } from './views/accounts';
import { NewArticle, EditArticle, ShowArticle, ShowArticles } from './views/articles';
import { NewCategory, EditCategory, ShowCategory, ShowCategories } from './views/categories';


function Tester() {
  return (<></>)
}


function App() {
  return (
    <Router>
      <NavBar signedIn={false}/>

      <Routes>
        {/* Basic Route */}
        <Route path='/testing' exact element={<Tester />} />
        <Route path='/' exact element={<Home />} />

        {/* Accounts Routes */}
        <Route path='/accounts/login' exact element={<Login />} />
        <Route path='/accounts/signup' exact element={<Signup />} />
        <Route path='/accounts/edit' exact element={<EditAccount />} />

        {/* Articles Routes */}
        <Route path='/articles' exact element={<ShowArticles />} />
        <Route path='/articles/:id' exact element={<ShowArticle />} />
        <Route path='/articles/new' exact element={<NewArticle />} />
        <Route path='/articles/:id/edit' exact element={<EditArticle />} />

        {/* Categories Routes */}
        <Route path='/categories' exact element={<ShowCategories />} />
        <Route path='/categories/:id' exact element={<ShowCategory />} />
        <Route path='/categories/new' exact element={<NewCategory />} />
        <Route path='/categories/:id/edit' exact element={<EditCategory />} />
      </Routes>
    </Router>
  );
}

export default App;
