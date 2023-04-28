import "./App.css";

import "bootstrap/dist/js/bootstrap";
import { Route, BrowserRouter as Router, Routes } from "react-router-dom";

import { NavBar } from "./components";
import { Home } from "./views/pages";
import { Login, Signup, EditAccount } from "./views/accounts";
import {
  NewArticle,
  EditArticle,
  ShowArticle,
  ShowArticles,
} from "./views/articles";
import { ShowCategory, ShowCategories } from "./views/categories";
import { ShowUser, ShowUsers } from "./views/users";

function Tester() {
  return <></>;
}

function App() {
  return (
    <Router>
      <NavBar signedIn={true} />

      <Routes>
        {/* Basic Route */}
        <Route path="/testing" exact element={<Tester />} />
        <Route path="/" exact element={<Home />} />

        {/* Accounts Routes */}
        <Route path="/accounts/login" exact element={<Login />} />
        <Route path="/accounts/signup" exact element={<Signup />} />
        <Route path="/accounts/edit" exact element={<EditAccount />} />

        {/* Articles Routes */}
        <Route path="/articles" exact element={<ShowArticles />} />
        <Route path="/articles/:id" exact element={<ShowArticle />} />
        <Route path="/articles/new" exact element={<NewArticle />} />
        <Route path="/articles/:id/edit" exact element={<EditArticle />} />

        {/* Categories Routes */}
        <Route path="/categories" exact element={<ShowCategories />} />
        <Route path="/categories/:id" exact element={<ShowCategory />} />

        {/* Users Routes */}
        <Route path="/users" exact element={<ShowUsers />} />
        <Route path="/users/:id" exact element={<ShowUser />} />
      </Routes>
    </Router>
  );
}

export default App;
