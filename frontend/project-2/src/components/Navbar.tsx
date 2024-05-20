import {Navbar, Container, Nav, Image} from 'react-bootstrap';

interface AppNavbarProps {
  activeKey?: string,
  setActiveKey?: (value: (((prevState: string) => string) | string)) => void
}

function AppNavbar({activeKey, setActiveKey}: AppNavbarProps) {

  function handleChangeTab(e) {
    if (setActiveKey) {
      setActiveKey(e.target.accessKey || 'home');
    }
  }

  return (
    <Navbar expand="lg" className="bg-body-tertiary">
      <Container>
        <Navbar.Brand onClick={handleChangeTab} className="font-bold cursor-pointer">
          <Image className="w-12 mr-2 rounded-circle" src="/images/logo.jpg"/>
          <span className="text-company-primary">Energy</span>
          <span> & </span>
          <span className="text-company-secondary">Water SpA</span>
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav"/>
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link onClick={handleChangeTab} active={activeKey === 'home'} accessKey='home'>Inicio</Nav.Link>
            <Nav.Link onClick={handleChangeTab} active={activeKey === 'story'} accessKey='story'>Historia</Nav.Link>
            <Nav.Link onClick={handleChangeTab} active={activeKey === 'team'} accessKey='team'>Equipo</Nav.Link>
            <Nav.Link onClick={handleChangeTab} active={activeKey === 'faq'} accessKey='faq'>Preguntas Frecuentes</Nav.Link>
            <Nav.Link onClick={handleChangeTab} active={activeKey === 'contact'} accessKey='contact'>Contacto</Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default AppNavbar;