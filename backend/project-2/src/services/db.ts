import mysql from 'mysql2/promise';

async function connect() {
    try {
        const connection = await mysql.createConnection({
            host: 'localhost',
            user: 'ciisa_backend_v1_eva2_A',
            password: 'l4cl4v3-c11s4',
            database: 'ciisa_backend_v1_eva2_A',
        });

        console.debug('Conexión a MySQL establecida.');

        return connection;
    } catch (error) {
        console.error('Error al conectar a MySQL:', error);
        throw error;
    }
}

export default connect;