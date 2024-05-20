import Container from "react-bootstrap/Container";
import Image from "react-bootstrap/Image";

function StoryPage() {
  return (
    <Container className="my-12 space-y-8">
      <div className="row">
        <div className="col-12">
          <h1 className="text-company-primary text-center">Historia</h1>
          <p className="text-center">Creando ambientes gratos y confortables a través del mantenimiento</p>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">Resumen</h4>
          <p>Bienvenido a Energy and Water SpA, empresa dedicada a la instalación y reparación de sistemas de
            ventilación, calefacción, electricidad y construcción. Contamos con un equipo de profesionales altamente
            cualificados y con amplia experiencia en el sector. Ofrecemos soluciones a medida para cada cliente,
            garantizando la calidad y la seguridad de nuestros servicios. Contacta con nosotros y solicita tu
            presupuesto sin compromiso.</p>
        </div>
        <div className="col-12 col-lg-6 col-xl-4">
          <Image src="/images/reparacion-matriz.webp" alt="Reparación de Matriz"
                 className="w-100 card"/>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">En qué punto nos encontramos</h4>
          <p>Somos una empresa fundada en 2018 con el objetivo de brindar servicios integrales de mantenimiento para
            hogares, oficinas, comercios e industrias. Nuestra misión es satisfacer las necesidades de nuestros clientes
            con eficiencia, rapidez y profesionalidad. Nuestra visión es ser la empresa referente en el mercado por
            nuestra excelencia y compromiso. Nuestros valores son la honestidad, la responsabilidad, el respeto y la
            innovación.</p>
        </div>
        <div className="col-12 col-sm-6 col-lg-4 col-xl-3">
          <Image src="/images/universidad-de-los-andes.webp" alt="Universidad De Los Andes"
                 className="w-100 card"/>
        </div>
        <div className="col-12 col-sm-6 col-lg-4 col-xl-3">
          <Image src="/images/vina-cousino-de-macul.webp" alt="Viña Cousiño Macul"
                 className="w-100 card"/>
        </div>
      </div>
      <div className="row">
        <div className="col-12 text-center">
          <h5 className="text-company-secondary mt-12">Contáctanos</h5>
          <p><a href="mailto:contacto@energyandwater.cl">contacto@energyandwater.cl</a> | Manquehue Sur 520, oficina
            205, Las Condes | <a href="tel:+56232569798">+56232569798</a></p>
        </div>
      </div>
    </Container>
  );
}

export default StoryPage;