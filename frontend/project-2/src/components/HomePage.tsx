import Container from "react-bootstrap/Container";
import Image from "react-bootstrap/Image";
import Button from "react-bootstrap/Button";

function HomePage() {
  return (
    <Container className="my-12 space-y-8">
      <div className="row">
        <div className="col-12">
          {/* HERO IMAGE*/}
          <div style={{
            backgroundImage: 'url("/images/hero.webp")',
            backgroundPosition: 'center',
            backgroundSize: 'cover',
            height: '400px'
          }} className="card flex items-center justify-content-center">
            <h1 className="text-white text-center">Mantenimiento para edificios</h1>
            <p className="text-center text-white">CLIMATIZACIÓN, ELECTRICIDAD Y OBRAS MENORES DE CONSTRUCCIÓN.</p>
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h2 className="text-company-primary text-center">Tipos de mantenimiento</h2>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">Mantenimiento</h4>
          <p>Conjunto de operaciones y cuidados necesarios para que tus instalaciones continúen funcionando
            correctamente.</p>
        </div>
        <div className="col-12">
          <h4 className="text-company-secondary">Mantenimiento preventivo</h4>
          <p>Ayuda a prolongar la vida útil de tus activos y aumenta la productividad, a través de una revisión.</p>
        </div>
        <div className="col-12">
          <h4 className="text-company-secondary">Mantenimiento correctivo</h4>
          <p>Corrige problemas o daños en las instalaciones o equipos.</p>
        </div>
      </div>
      <div className="row space-y-12 gap-y-4">
        <div className="col-12 col-md-6">
          <div className="row">
            <div className="col-6">
              <Image src="/images/aire-acondicionado.webp" alt="Aire acondicionado" className="w-100 card"/>
            </div>
            <div className="col-6">
              <h4 className="text-company-secondary">Aire acondicionado</h4>
              <p>Instalamos, reparamos y revisamos todo tipo de sistemas de aire acondicionado, tanto domésticos como
                industriales. Nos encargamos de la limpieza, el cambio de filtros, la recarga de gas y la detección y
                solución de averías.</p>
            </div>
          </div>
        </div>
        <div className="col-12 col-md-6">
          <div className="row">
            <div className="col-6">
              <Image src="/images/sala-calderas.webp" alt="Sala de calderas" className="w-100 card"/>
            </div>
            <div className="col-6">
              <h4 className="text-company-secondary">Sala de calderas</h4>
              <p>Instalamos, reparamos y revisamos todo tipo de calderas, tanto de gas como eléctricas. Nos encargamos
                del
                mantenimiento preventivo, la sustitución de piezas, la purga de radiadores y la regulación de la presión
                y
                la temperatura.</p>
            </div>
          </div>
        </div>
        <div className="col-12 col-md-6">
          <div className="row">
            <div className="col-6">
              <Image src="/images/grupo-electrogeno.webp" alt="Grupo electrógeno" className="w-100 card"/>
            </div>
            <div className="col-6">
              <h4 className="text-company-secondary">Grupo electrógeno</h4>
              <p>Instalamos, reparamos y revisamos todo tipo de grupos electrógenos, tanto monofásicos como trifásicos.
                Nos encargamos del suministro de combustible, el cambio de aceite, el control de baterías y la
                verificación
                del funcionamiento correcto.</p>
            </div>
          </div>
        </div>
        <div className="col-12 col-md-6">
          <div className="row">
            <div className="col-6">
              <Image src="/images/sala-de-bombas.webp" alt="Sala de bombas" className="w-100 card"/>
            </div>
            <div className="col-6">
              <h4 className="text-company-secondary">Sala de bombas</h4>
              <p>Instalamos, reparamos y revisamos todo tipo de bombas hidráulicas, tanto centrífugas como periféricas.
                Nos encargamos del ajuste de válvulas, el cambio de sellos mecánicos, el equilibrado de rotores y la
                limpieza de impulsores.</p>
            </div>
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col-12 text-center">
          <h5 className="text-company-secondary mt-12">¿Alguna pregunta?</h5>
          <p>Envía un correo a <a href="mailto:contacto@energyandwater.cl">contacto@energyandwater.cl</a> o escribenos
            por Whatsapp para obtener más información sobre mantenimiento</p>
          <Button href="https://wa.me/#" target="_blank" variant="primary">Whatsapp</Button>
        </div>
      </div>
    </Container>
  );
}

export default HomePage;