import { useState } from 'react'
import logo from './logo.svg';
import './App.css';
import MyLib from "my_lib";

function App() {
  const [lib, setLib] = useState(null);
  MyLib.load().then((lib) => setLib(lib));

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
          3 multiplied by 2 = {lib && lib.multiply_by_two(3)}.
      </header>
    </div>
  );
}

export default App;
