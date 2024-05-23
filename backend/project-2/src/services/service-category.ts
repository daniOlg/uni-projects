import connect from './db';
import {ServiceCategory, ServiceCategoryWithId} from "../types/service-category";

export async function getAllServiceCategories() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM categoria_servicio');
    return rows;
}

export async function getServiceCategoryById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM categoria_servicio WHERE id = ?', [id]);
    return rows;
}

export async function insertServiceCategory({name, image, text, active}: ServiceCategory) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO categoria_servicio (nombre, imagen, texto, activo) VALUES (?, ?, ?, ?)', [name, image, text, active]);
        console.debug('[Service Category] Data inserted:', result);
    } catch (error) {
        console.error('[Service Category] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateServiceCategory({id, name, image, text, active}: ServiceCategoryWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE categoria_servicio SET nombre = ?, imagen = ?, texto = ?, activo = ? WHERE id = ?', [name, image, text, active, id]);
        console.debug('[Service Category] Data updated:', result);
    } catch (error) {
        console.error('[Service Category] Error updating data:', error);
    } finally {
        db.end();
    }
}

export async function activateServiceCategory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE categoria_servicio SET activo = true WHERE id = ?', [id]);
        console.debug('[Service Category] Data activated:', result);
    } catch (error) {
        console.error('[Service Category] Error activating data:', error);
    } finally {
        db.end();
    }
}

export async function deactivateServiceCategory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE categoria_servicio SET activo = false WHERE id = ?', [id]);
        console.debug('[Service Category] Data deactivated:', result);
    } catch (error) {
        console.error('[Service Category] Error deactivating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteServiceCategory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM categoria_servicio WHERE id = ?', [id]);
        console.debug('[Service Category] Data deleted:', result);
    } catch (error) {
        console.error('[Service Category] Error deleting data:', error);
    } finally {
        db.end();
    }
}