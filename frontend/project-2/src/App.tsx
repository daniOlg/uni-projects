import Tab from 'react-bootstrap/Tab';
import AppNavbar from "./components/Navbar.tsx";
import {useState} from "react";

function App() {
  const [activeKey, setActiveKey] = useState('home');

  return (
    <main>
      <Tab.Container activeKey={activeKey} defaultActiveKey="home">
        <AppNavbar activeKey={activeKey} setActiveKey={setActiveKey}/>
        <Tab.Content>
          <Tab.Pane eventKey="home">
            <h1>Home</h1>
          </Tab.Pane>
          <Tab.Pane eventKey="history">
            <h1>History</h1>
          </Tab.Pane>
          <Tab.Pane eventKey="team">
            <h1>Team</h1>
          </Tab.Pane>
          <Tab.Pane eventKey="faq">
            <h1>FAQ</h1>
          </Tab.Pane>
          <Tab.Pane eventKey="contact">
            <h1>Contact</h1>
          </Tab.Pane>
        </Tab.Content>
      </Tab.Container>
    </main>)
}

export default App
