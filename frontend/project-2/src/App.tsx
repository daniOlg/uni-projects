import Tab from 'react-bootstrap/Tab';
import AppNavbar from "./components/Navbar.tsx";
import {useState} from "react";
import ContactPage from "./components/ContactPage.tsx";
import FAQPage from "./components/FAQPage.tsx";
import TeamPage from "./components/TeamPage.tsx";
import StoryPage from "./components/StoryPage.tsx";
import HomePage from './components/HomePage.tsx';

function App() {
  const [activeKey, setActiveKey] = useState('home');

  return (
    <main>
      <Tab.Container activeKey={activeKey} defaultActiveKey="home">
        <AppNavbar activeKey={activeKey} setActiveKey={setActiveKey}/>
        <Tab.Content>
          <Tab.Pane eventKey="home">
            <HomePage/>
          </Tab.Pane>
          <Tab.Pane eventKey="story">
            <StoryPage/>
          </Tab.Pane>
          <Tab.Pane eventKey="team">
            <TeamPage/>
          </Tab.Pane>
          <Tab.Pane eventKey="faq">
            <FAQPage/>
          </Tab.Pane>
          <Tab.Pane eventKey="contact">
            <ContactPage/>
          </Tab.Pane>
        </Tab.Content>
      </Tab.Container>
    </main>)
}

export default App
