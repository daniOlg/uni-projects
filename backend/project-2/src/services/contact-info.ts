import connect from './db';
import {ContactInfo, ContactInfoWithId} from "../types/contact-info";

export async function getAllContactInfo() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM info_contacto');
    return rows;
}

export async function getContactInfoById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM info_contacto WHERE id = ?', [id]);
    return rows;
}

export async function insertContactInfo({name, text, additionalText, icon, active}: ContactInfo) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO info_contacto (nombre, texto, texto_adicional, icono, activo) VALUES (?, ?, ?, ?, ?)', [name, text, additionalText, icon, active]);
        console.debug('[Contact] Data inserted:', result);
    } catch (error) {
        console.error('[Contact] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateContactInfo({id, name, text, additionalText, icon, active}: ContactInfoWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE info_contacto SET nombre = ?, texto = ?, texto_adicional = ?, icono = ?, activo = ? WHERE id = ?', [name, text, additionalText, icon, active, id]);
        console.debug('[Contact] Data updated:', result);
    } catch (error) {
        console.error('[Contact] Error updating data:', error);
    } finally {
        db.end();
    }
}

export async function activateContactInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE info_contacto SET activo = true WHERE id = ?', [id]);
        console.debug('[Contact] Data activated:', result);
    } catch (error) {
        console.error('[Contact] Error activating data:', error);
    } finally {
        db.end();
    }
}

export async function deactivateContactInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE info_contacto SET activo = false WHERE id = ?', [id]);
        console.debug('[Contact] Data deactivated:', result);
    } catch (error) {
        console.error('[Contact] Error deactivating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteContactInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM info_contacto WHERE id = ?', [id]);
        console.debug('[Contact] Data deleted:', result);
    } catch (error) {
        console.error('[Contact] Error deleting data:', error);
    } finally {
        db.end();
    }
}