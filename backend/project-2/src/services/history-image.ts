import connect from './db';
import {HistoryImage, HistoryImageWithId} from "../types/history-image";

export async function getAllHistoryImages() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM historia_imagen');
    return rows;
}

export async function getHistoryImageById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM historia_imagen WHERE id = ?', [id]);
    return rows;
}

export async function getHistoryImagesByHistoryId(historyId: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM historia_imagen WHERE historia_id = ?', [historyId]);
    return rows;
}

export async function insertHistoryImage({historyId, imageId}: HistoryImage) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO historia_imagen (historia_id, imagen_id) VALUES (?, ?)', [historyId, imageId]);
        console.debug('[History Image] Data inserted:', result);
    } catch (error) {
        console.error('[History Image] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateHistoryImage({id, historyId, imageId}: HistoryImageWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE historia_imagen SET historia_id = ?, imagen_id = ? WHERE id = ?', [historyId, imageId, id]);
        console.debug('[History Image] Data updated:', result);
    } catch (error) {
        console.error('[History Image] Error updating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteHistoryImage(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM historia_imagen WHERE id = ?', [id]);
        console.debug('[History Image] Data deleted:', result);
    } catch (error) {
        console.error('[History Image] Error deleting data:', error);
    } finally {
        db.end();
    }
}