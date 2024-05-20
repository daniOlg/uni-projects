import Container from "react-bootstrap/Container";
import Image from "react-bootstrap/Image";
import Button from "react-bootstrap/Button";

function TeamPage() {
  // Maqueta de la página de equipo
  // titulo: Compartimos una visión clara del objetivo, fomentamos un clima de confianza, colaboración y apoyo mutuo entre los integrantes del equipo.
  //
  // subtitulo: Liderazgo
  // parrafo: Mizraim Abello es el fundador de Energy and Water SpA, es un líder colaborativo que se desempeña en el ámbito laboral, específicamente en el sector de la climatización y electricidad. Practica un liderazgo democrático; es decir, que involucra al equipo de trabajo en la toma de decisiones y valora sus opiniones y sugerencias. Sus principales habilidades como líder son la resolución de problemas, la comunicación efectiva, el pensamiento crítico, la capacidad de coordinación y gestión. Algunos de los logros más destacados son haber participado en la acreditación de los centros de salud de la municipalidad de San Joaquín, reparación del equipo de climatización para el museo de la Universidad de los Andes y haber realizado reparaciones y cambios de grupos electrógenos que son críticos para el funcionamiento de los edificios. Uno de los desafíos que enfrentó como líder fue adaptarse a las nuevas normativas sanitarias por la pandemia y garantizar la seguridad del equipo y los clientes. Lo logró implementando protocolos de prevención y capacitando al personal. Su objetivo como líder es darle continuidad operacional a los clientes y mejorar constantemente los procesos de mantenimiento y calidad.
  //
  // imagen: Imagen de Mantenimiento para edificios
  // sub de la imagen de mantenimiento: Mantenimiento para edificios.
  //
  // subitutlo: Este es nuestro equipo
  // parrafo: En Energy And Water SpA nos dedicamos a crear ambientes gratos y confortables a través del mantenimiento para calderas, aire acondicionado, salas de bombas, grupos electrógenos y electricidad, entre otros.
  //
  // imagen: Imagen de seccion equipo de trabajo
  // El servicio nos mueve
  //
  // aqui va un grid con las imagenes de los integrantes del equipo
  // imagen: imagen de Mizraim Abello Avello
  // integrante equipo: Mizraim Abello Avello
  //
  // imagen: imagen de Marcelo Fuentes Orellana
  // integrante equipo: Marcelo Fuentes Orellana
  //
  // imagen: imagen de Juan Pérez
  // integrante equipo (ejemplo maquetado):  [Nombre]
  //
  // imagen: imagen de Juan Pérez
  // integrante equipo (ejemplo maquetado):  [Nombre]
  //
  // imagen: imagen de Juan Pérez
  // integrante equipo (ejemplo maquetado):  [Nombre]
  //
  // subtitulo: Únete al equipo
  // parrafo: Describe brevemente qué cualidades deben tener tus compañeros.
  //
  // boton primario: Enviar solicitud
  return (
    <Container className="my-12 space-y-8">
      <div className="row">
        <h1 className="text-company-primary text-center">Compartimos una visión clara del objetivo, fomentamos un
          clima de confianza, colaboración y apoyo mutuo entre
          los integrantes del equipo.</h1>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">Liderazgo</h4>
          <p>
            Mizraim Abello es el fundador de Energy and Water SpA, es un líder colaborativo que se desempeña en el
            ámbito
            laboral, específicamente en el sector de la climatización y electricidad. Practica un liderazgo democrático;
            es
            decir, que involucra al equipo de trabajo en la toma de decisiones y valora sus opiniones y sugerencias. Sus
            principales habilidades como líder son la resolución de problemas, la comunicación efectiva, el pensamiento
            crítico, la capacidad de coordinación y gestión. Algunos de los logros más destacados son haber participado
            en
            la acreditación de los centros de salud de la municipalidad de San Joaquín, reparación del equipo de
            climatización para el museo de la Universidad de los Andes y haber realizado reparaciones y cambios de
            grupos
            electrógenos que son críticos para el funcionamiento de los edificios. Uno de los desafíos que enfrentó como
            líder fue adaptarse a las nuevas normativas sanitarias por la pandemia y garantizar la seguridad del equipo
            y
            los clientes. Lo logró implementando protocolos de prevención y capacitando al personal. Su objetivo como
            líder
            es darle continuidad operacional a los clientes y mejorar constantemente los procesos de mantenimiento y
            calidad.
          </p>
          <div className="col-12 col-lg-6 col-xl-4">
            <Image src="/images/mantenimiento-para-edificios.webp" alt="Mantenimiento para edificios"
                   className="w-100 card"/>
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">Este es nuestro equipo</h4>
          <p>En Energy And Water SpA nos dedicamos a crear ambientes gratos y confortables a través del mantenimiento
            para
            calderas, aire acondicionado, salas de bombas, grupos electrógenos y electricidad, entre otros.</p>
        </div>
        <div className="col-12 col-lg-6 col-xl-4">
          <Image src="/images/el-servicio-nos-mueve.webp" alt="El servicio nos mueve" className="w-100 card"/>
        </div>
      </div>
      <div className="row gap-y-6">
        <div className="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
          <div className="card">
            <img className="w-100 card-img"
                 src="https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg"
                 alt="El servicio nos mueve"/>
            <sub className="text-center card-body">Mizraim Abello Avello</sub>
          </div>
        </div>
        <div className="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
          <div className="card">
            <img className="w-100 card-img"
                 src="https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg"
                 alt="El servicio nos mueve"/>
            <sub className="text-center card-body">Marcelo Fuentes Orellana</sub>
          </div>
        </div>
        <div className="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
          <div className="card">
            <img className="w-100 card-img"
                 src="https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg"
                 alt="El servicio nos mueve"/>
            <sub className="text-center card-body">Juan Pérez</sub>
          </div>
        </div>
        <div className="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
          <div className="card">
            <img className="w-100 card-img"
                 src="https://img.freepik.com/free-vector/illustration-businessman_53876-5856.jpg"
                 alt="El servicio nos mueve"/>
            <sub className="text-center card-body">Pablo González</sub>
          </div>
        </div>
      </div>
      <div className="row">
        <div className="col-12">
          <h4 className="text-company-secondary">Únete al equipo</h4>
          <p>Describe brevemente qué cualidades deben tener tus compañeros.</p>
        </div>
        <div className="col-6">
          <Button className="btn btn-primary btn-block">Enviar solicitud</Button>
        </div>
      </div>
    </Container>
  );
}

export default TeamPage;