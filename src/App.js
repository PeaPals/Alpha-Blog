import './App.css';

import { Home } from './views/pages';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';
import { NavBar } from './components/navbar';
import { GridView } from './components/gridview';



function Tester() {

  const data = [
    {
      header: "some header",
      title: "some title",
      text: "some text",
      footer: "some footer",
      additionalComponent: <><h1>Something</h1></>
    },

    {
      header: "some header",
      title: "some title",
      text: "some text",
      footer: "some footer",
      additionalComponent: <><h1>Something</h1></>
    },

    {
      header: "some header",
      title: "some title",
      text: "some text",
      footer: "some footer",
      additionalComponent: <><h1>Something</h1></>
    },

    {
      header: "some header",
      title: "some title",
      text: "some text",
      footer: "some footer",
      additionalComponent: <><h1>Something</h1></>
    },

    {
      header: "some header",
      title: "some title",
      text: "some text",
      footer: "some footer",
      additionalComponent: <><h1>Something</h1></>
    }
  ]

  return (
    <GridView
      list={data}
      columns={3}
    />
  )
}


function App() {
  return (
    <Router>
      <NavBar signedIn={false}/>

      <Routes>
        <Route path='/' exact element={<Home />} />
        <Route path='/testing' exact element={<Tester />} />
      </Routes>
    </Router>
  );
}

export default App;
