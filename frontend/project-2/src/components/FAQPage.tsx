import Container from "react-bootstrap/Container";

function FAQPage() {
  return (
    <Container className="mt-12">
      <div className="row">
        <div className="col-12">
          <h1 className="text-company-primary text-5xl mb-5 text-center">Preguntas frecuentes</h1>
          <h2 className="text-company-secondary">Elige una pregunta:</h2>
          <ul className="text-lg">
            <li>¿Cómo solicito una cotización?</li>
            <li>¿Necesitas visita técnica?</li>
            <li>¿Qué tipo de aire acondicionado pueden revisar?</li>
            <li>¿Realizan instalación de aire acondicionado domiciliario?</li>
          </ul>
          <h2 className="text-company-secondary">Respuestas:</h2>
          <p className="text-lg pl-4">Puedes contactarnos al correo <a
            href="mailto:contacto@energyandwater.cl">contacto@energyandwater.cl</a> o
            al <a href="tel:+56232569798">+56232569798</a>.
          </p>
          <h2 className="text-company-secondary">¿Necesitas visita técnica?</h2>
          <p className="text-lg pl-4">Puedes solicitar visita técnica para evaluación mediante correo electrónico <a
            href="mailto:contacto@energyandwater.cl">contacto@energyandwater.cl</a> o
            al <a href="tel:+56232569798">+56232569798</a></p>
          <h2 className="text-company-secondary">¿Qué tipo de aire acondicionado pueden revisar?</h2>
          <p className="text-lg pl-4">Revisamos, reparamos e instalamos equipos domiciliarios e industriales.</p>
        </div>
      </div>
    </Container>
  );
}

export default FAQPage;