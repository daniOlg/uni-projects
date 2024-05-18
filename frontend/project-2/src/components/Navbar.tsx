import {Navbar, Container, Nav, Image} from 'react-bootstrap';

function AppNavbar() {
  return (
    <Navbar expand="lg" className="bg-body-tertiary">
      <Container>
        <Navbar.Brand href="#home" className="font-bold">
          <Image className="w-12 mr-2 rounded-circle" src="/images/logo.jpg" />
          <span className="text-company-primary">Energy</span>
          <span> & </span>
          <span className="text-company-secondary">Water SpA</span>
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="#home">Inicio</Nav.Link>
            <Nav.Link href="#link">Historia</Nav.Link>
            <Nav.Link href="#team">Equipo</Nav.Link>
            <Nav.Link href="#faq">Preguntas frecuentes</Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default AppNavbar;