import Card from "react-bootstrap/Card";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import Image from "react-bootstrap/Image";

function ContactPage() {
  return (
    <Container className='mt-12'>
      <Card className="sm:mx-0 lg:mx-24 bg-card-bg mb-32 rounded-4">
        <Card.Body className="bg-card-bg rounded-4">
          <Card.Text className="text-gray-200">
            <div className="row gap-y-4 px-12 pt-12">
              <div className="col-12 col-lg-6 align-self-center">
                <Image className="rounded-circle w-100" src="/images/logo.jpg"/>
              </div>
              <div className="col-12 col-lg-6">
                <div className="text-4xl">
                  <p>Ofrecemos soluciones a medida para cada cliente, garantizando la calidad y la seguridad de nuestros
                    servicios.</p>
                  <p className="d-none d-md-block">
                    Contacta con nosotros y solicita tu presupuesto sin compromiso.
                  </p>
                </div>
              </div>
              <div className="col-12 col-md-12 d-md-none">
                <div className="text-4xl">
                  <p>Contacta con nosotros y solicita tu presupuesto sin compromiso.</p>
                </div>
              </div>
            </div>
            <form className="row px-12 pb-12">
              <div className="mb-3 col-12 col-md-6">
                <label htmlFor="name" className="form-label">Nombre <span className="text-red-500">*</span></label>
                <input type="text" className="form-control" id="name"/>
              </div>
              <div className="mb-3 col-12 col-md-6">
                <label htmlFor="email" className="form-label">E-mail <span className="text-red-500">*</span></label>
                <input type="email" className="form-control" id="email"/>
              </div>
              <div className="mb-3 col-12">
                <label htmlFor="address" className="form-label">Dirección <span
                  className="text-red-500">*</span></label>
                <input type="text" className="form-control" id="address"/>
              </div>
              <div className="mb-3 col-12">
                <label htmlFor="message" className="form-label">Mensaje <span className="text-red-500">*</span></label>
                <textarea className="form-control" id="message"/>
              </div>
              <div className="col-12 mt-4">
                <Button className="col-12" variant="primary" type="submit">
                  Enviar
                </Button>
              </div>
            </form>
          </Card.Text>

        </Card.Body>
      </Card>
    </Container>
  );
}

export default ContactPage;