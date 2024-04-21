# NOTA: Algunas partes del codigo fueron extraidas del ejemplo de la clase

# CLEAR / LIMPIAR
DROP TABLE services;
DROP TABLE about_us;
DROP TABLE titles;
DROP TABLE texts;
DROP TABLE contents;
DROP DATABASE ciisa_project_v1;
DROP USER IF EXISTS 'ciisa_project_v1'@'localhost';

# CREATE NECESARY / CREAR COSAS NECESARIAS
CREATE DATABASE ciisa_project_v1;
CREATE USER 'ciisa_project_v1'@'localhost' IDENTIFIED BY 'l4cl4v3-c11s4';
GRANT ALL PRIVILEGES ON ciisa_project_v1.* TO 'ciisa_project_v1'@'localhost';
FLUSH PRIVILEGES;

# USE PROJECT DATABASE / USAR BASE DE DATOS DEL PROYECTO
USE ciisa_project_v1;

# INSERT INITIAL DATA / INSERTAR DATOS INICIALES
# SERVICES / SERVICIOS
INSERT INTO titles (esp, eng) VALUES ('Consultoría digital', 'Digital consultancy');
INSERT INTO texts (esp, eng) VALUES ('Identificamos las fallas y conectamos los puntos entre tu negocio y tu estrategia digital. Nuestro equipo experto cuenta con años de experiencia en la definición de estrategias y hojas de ruta en función de tus objetivos específicos.', 'We identify the failures and connect the dots between your business and your digital strategy. Our expert team has years of experience in defining strategies and roadmaps based on your specific objectives.');
INSERT INTO services (title_id, text_id, activo) VALUES (1, 1, true);

INSERT INTO titles (esp, eng) VALUES ('Soluciones multiexperiencia', 'Multi-experience solutions');
INSERT INTO texts (esp, eng) VALUES ('Deleitamos a las personas usuarias con experiencias interconectadas a través de aplicaciones web, móviles, interfaces conversacionales, digital twin, IoT y AR. Su arquitectura puede adaptarse y evolucionar para adaptarse a los cambios de tu organización.', 'We delight users with interconnected experiences through web, mobile, conversational interfaces, digital twin, IoT, and AR applications. Its architecture can adapt and evolve to accommodate changes in your organization.');
INSERT INTO services (title_id, text_id, activo) VALUES (2, 2, true);

INSERT INTO titles (esp, eng) VALUES ('Evolución de ecosistemas', 'Ecosystem evolution');
INSERT INTO texts (esp, eng) VALUES ('Ayudamos a las empresas a evolucionar y ejecutar sus aplicaciones de forma eficiente, desplegando equipos especializados en la modernización y el mantenimiento de ecosistemas técnicos. Creando soluciones robustas en tecnologías de vanguardia.', 'We help companies evolve and execute their applications efficiently, deploying specialized teams in the modernization and maintenance of technical ecosystems. Creating robust solutions in cutting-edge technologies.');
INSERT INTO services (title_id, text_id, activo) VALUES (3, 3, true);

INSERT INTO titles (esp, eng) VALUES ('Soluciones Low-Code', 'Low-Code solutions');
INSERT INTO texts (esp, eng) VALUES ('Traemos el poder de las soluciones low-code y no-code para ayudar a nuestros clientes a acelerar su salida al mercado y añadir valor. Aumentamos la productividad y la calidad, reduciendo los requisitos de cualificación de los desarrolladores.', 'We bring the power of low-code and no-code solutions to help our clients accelerate their market entry and add value. We increase productivity and quality, reducing developer qualification requirements.');
INSERT INTO services (title_id, text_id, activo) VALUES (4, 4, true);

# ABOUT US
INSERT INTO titles (esp, eng) VALUES ('Misión', 'Mission');
INSERT INTO contents (esp, eng) VALUES ('Nuestra misión es ofrecer soluciones digitales innovadoras y de alta calidad que impulsen el éxito de nuestros clientes, ayudándolos a alcanzar sus objetivos empresariales a través de la tecnología y la creatividad.', 'Our mission is to offer innovative and high-quality digital solutions that drive the success of our clients, helping them achieve their business objectives through technology and creativity.');
INSERT INTO about_us (name, title_id, content_id) VALUES ('mision', 5, 1);

INSERT INTO titles (esp, eng) VALUES ('Visión', 'Vision');
INSERT INTO contents (esp, eng) VALUES ('Nos visualizamos como líderes en el campo de la consultoría y desarrollo de software, reconocidos por nuestra excelencia en el servicio al cliente, nuestra capacidad para adaptarnos a las necesidades cambiantes del mercado y nuestra contribución al crecimiento y la transformación digital de las empresas', 'We envision ourselves as leaders in the field of software consulting and development, recognized for our excellence in customer service, our ability to adapt to changing market needs, and our contribution to the growth and digital transformation of companies.');
INSERT INTO about_us (name, title_id, content_id) VALUES ('vision', 6, 2);


# CREATE TABLES / CREAR TABLAS
CREATE TABLE titles (
    id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    esp VARCHAR(255),
    eng VARCHAR(255)
);

CREATE TABLE texts (
    id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    esp TEXT,
    eng TEXT
);

CREATE TABLE contents (
    id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    esp TEXT,
    eng TEXT
);

CREATE TABLE services (
    id       INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title_id INT,
    text_id  INT,
    activo   BOOLEAN DEFAULT true,
    FOREIGN KEY (title_id) REFERENCES titles (id),
    FOREIGN KEY (text_id) REFERENCES texts (id)
);

CREATE TABLE about_us (
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255),
    title_id   INT,
    content_id INT,
    FOREIGN KEY (title_id) REFERENCES titles (id),
    FOREIGN KEY (content_id) REFERENCES contents (id)
);

-- SERVICES TABLE OPERATIONS / OPERACIONES EN TABLA SERVICIOS
-- GET / ALL services
SELECT s.id, ti.esp AS title_esp, ti.eng AS title_eng, te.esp AS text_esp, te.eng AS text_eng, s.activo
FROM services s JOIN titles ti ON s.text_id = ti.id JOIN texts te ON s.text_id = te.id;

-- GET / BY ID service
SELECT s.id, ti.esp AS title_esp, ti.eng AS title_eng, te.esp AS text_esp, te.eng AS text_eng, s.activo
FROM services s JOIN titles ti ON s.text_id = ti.id JOIN texts te ON s.text_id = te.id
WHERE s.id = 1;

-- POST service
INSERT INTO titles (esp, eng) VALUES ('Consultoría digital', 'Digital consultancy');
INSERT INTO texts (esp, eng) VALUES ('Identificamos las fallas y conectamos los puntos entre tu negocio y tu estrategia digital. Nuestro equipo experto cuenta con años de experiencia en la definición de estrategias y hojas de ruta en función de tus objetivos específicos.', 'We identify the failures and connect the dots between your business and your digital strategy. Our expert team has years of experience in defining strategies and roadmaps based on your specific objectives.');
INSERT INTO services (title_id, text_id, activo) VALUES (1, 1, true);

INSERT INTO titles (esp, eng) VALUES ('Soluciones multiexperiencia', 'Multi-experience solutions');
INSERT INTO texts (esp, eng) VALUES ('Deleitamos a las personas usuarias con experiencias interconectadas a través de aplicaciones web, móviles, interfaces conversacionales, digital twin, IoT y AR. Su arquitectura puede adaptarse y evolucionar para adaptarse a los cambios de tu organización.', 'We delight users with interconnected experiences through web, mobile, conversational interfaces, digital twin, IoT, and AR applications. Its architecture can adapt and evolve to accommodate changes in your organization.');
INSERT INTO services (title_id, text_id, activo) VALUES (2, 2, true);

INSERT INTO titles (esp, eng) VALUES ('Evolución de ecosistemas', 'Ecosystem evolution');
INSERT INTO texts (esp, eng) VALUES ('Ayudamos a las empresas a evolucionar y ejecutar sus aplicaciones de forma eficiente, desplegando equipos especializados en la modernización y el mantenimiento de ecosistemas técnicos. Creando soluciones robustas en tecnologías de vanguardia.', 'We help companies evolve and execute their applications efficiently, deploying specialized teams in the modernization and maintenance of technical ecosystems. Creating robust solutions in cutting-edge technologies.');
INSERT INTO services (title_id, text_id, activo) VALUES (3, 3, true);

INSERT INTO titles (esp, eng) VALUES ('Soluciones Low-Code', 'Low-Code solutions');
INSERT INTO texts (esp, eng) VALUES ('Traemos el poder de las soluciones low-code y no-code para ayudar a nuestros clientes a acelerar su salida al mercado y añadir valor. Aumentamos la productividad y la calidad, reduciendo los requisitos de cualificación de los desarrolladores.', 'We bring the power of low-code and no-code solutions to help our clients accelerate their market entry and add value. We increase productivity and quality, reducing developer qualification requirements.');
INSERT INTO services (title_id, text_id, activo) VALUES (4, 4, true);

-- PATCH / ENABLE service
UPDATE services SET activo = true WHERE id = 1;

-- PATCH / DISABLE service
UPDATE services SET activo = false WHERE id = 1;

-- PUT service - change text asocciated with service using service id
UPDATE texts SET esp = 'Identificamos las fallas y conectamos los puntos entre tu negocio y tu estrategia digital. Nuestro equipo experto cuenta con años de experiencia en la definición de estrategias y hojas de ruta en función de tus objetivos específicos. Nuestro equipo experto cuenta con años de experiencia en la definición de estrategias y hojas de ruta en función de tus objetivos específicos.', eng = 'We identify the failures and connect the dots between your business and your digital strategy. Our expert team has years of experience in defining strategies and roadmaps based on your specific objectives. Our expert team has years of experience in defining strategies and roadmaps based on your specific objectives.' WHERE id = 1;

-- DELETE service
DELETE FROM services WHERE id = 1;

-- ABOUT US TABLE OPERATIONS / OPERACIONES EN TABLA "SOBRE NOSOTROS"
-- GET / ALL about-us
SELECT a.id, ti.esp AS title_esp, ti.eng AS title_eng, co.esp AS content_esp, co.eng AS content_eng
FROM about_us a JOIN titles ti ON a.title_id = ti.id JOIN contents co ON a.content_id = co.id;

-- GET / BY ID about-us
SELECT a.id, ti.esp AS title_esp, ti.eng AS title_eng, co.esp AS content_esp, co.eng AS content_eng
FROM about_us a JOIN titles ti ON a.title_id = ti.id JOIN contents co ON a.content_id = co.id
WHERE a.id = 1;

-- POST about-us
INSERT INTO titles (esp, eng) VALUES ('Misión', 'Mission');
INSERT INTO contents (esp, eng) VALUES ('Nuestra misión es ofrecer soluciones digitales innovadoras y de alta calidad que impulsen el éxito de nuestros clientes, ayudándolos a alcanzar sus objetivos empresariales a través de la tecnología y la creatividad.', 'Our mission is to offer innovative and high-quality digital solutions that drive the success of our clients, helping them achieve their business objectives through technology and creativity.');
INSERT INTO about_us (name, title_id, content_id) VALUES ('mision', 5, 1);

INSERT INTO titles (esp, eng) VALUES ('Visión', 'Vision');
INSERT INTO contents (esp, eng) VALUES ('Nos visualizamos como líderes en el campo de la consultoría y desarrollo de software, reconocidos por nuestra excelencia en el servicio al cliente, nuestra capacidad para adaptarnos a las necesidades cambiantes del mercado y nuestra contribución al crecimiento y la transformación digital de las empresas', 'We envision ourselves as leaders in the field of software consulting and development, recognized for our excellence in customer service, our ability to adapt to changing market needs, and our contribution to the growth and digital transformation of companies.');
INSERT INTO about_us (name, title_id, content_id) VALUES ('vision', 6, 2);

-- PUT about-us - change content asocciated with about-us using about-us id
UPDATE contents SET esp = 'Nuestra misión es ofrecer soluciones digitales innovadoras y de alta calidad que impulsen el éxito de nuestros clientes, ayudándolos a alcanzar sus objetivos empresariales a través de la tecnología y la creatividad. Nuestra misión es ofrecer soluciones digitales innovadoras y de alta calidad que impulsen el éxito de nuestros clientes, ayudándolos a alcanzar sus objetivos empresariales a través de la tecnología y la creatividad.', eng = 'Our mission is to offer innovative and high-quality digital solutions that drive the success of our clients, helping them achieve their business objectives through technology and creativity. Our mission is to offer innovative and high-quality digital solutions that drive the success of our clients, helping them achieve their business objectives through technology and creativity.' WHERE id = 5;

-- DELETE about-us
DELETE FROM about_us WHERE id = 1;
