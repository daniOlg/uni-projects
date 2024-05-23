import connect from './db';
import {Image, ImageWithId} from "../types/image";

export async function getAllImages() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM imagen');
    return rows;
}

export async function getImageById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM imagen WHERE id = ?', [id]);
    return rows;
}

export async function insertImage({name, image, active}: Image) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO imagen (nombre, imagen, activo) VALUES (?, ?, ?)', [name, image, active]);
        console.debug('[Image] Data inserted:', result);
    } catch (error) {
        console.error('[Image] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateImage({id, name, image, active}: ImageWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE imagen SET nombre = ?, imagen = ?, activo = ? WHERE id = ?', [name, image, active, id]);
        console.debug('[Image] Data updated:', result);
    } catch (error) {
        console.error('[Image] Error updating data:', error);
    } finally {
        db.end();
    }
}

export async function activateImage(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE imagen SET activo = true WHERE id = ?', [id]);
        console.debug('[Image] Data activated:', result);
    } catch (error) {
        console.error('[Image] Error activating data:', error);
    } finally {
        db.end();
    }
}

export async function deactivateImage(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE imagen SET activo = false WHERE id = ?', [id]);
        console.debug('[Image] Data deactivated:', result);
    } catch (error) {
        console.error('[Image] Error deactivating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteImage(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM imagen WHERE id = ?', [id]);
        console.debug('[Image] Data deleted:', result);
    } catch (error) {
        console.error('[Image] Error deleting data:', error);
    } finally {
        db.end();
    }
}