import connect from './db';
import { History, HistoryWithId } from "../types/history";

export async function getAllHistory() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM historia');
    return rows;
}

export async function getHistoryById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM historia WHERE id = ?', [id]);
    return rows;
}

export async function insertHistory({type, text, active}: History) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO historia (tipo, texto, activo) VALUES (?, ?, ?)', [type, text, active]);
        console.debug('[History] Data inserted:', result);
    } catch (error) {
        console.error('[History] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateHistory({id, type, text, active}: HistoryWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE historia SET tipo = ?, texto = ?, activo = ? WHERE id = ?', [type, text, active, id]);
        console.debug('[History] Data updated:', result);
    } catch (error) {
        console.error('[History] Error updating data:', error);
    } finally {
        db.end();
    }
}

export async function activateHistory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE historia SET activo = true WHERE id = ?', [id]);
        console.debug('[History] Data activated:', result);
    } catch (error) {
        console.error('[History] Error activating data:', error);
    } finally {
        db.end();
    }
}

export async function deactivateHistory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE historia SET activo = false WHERE id = ?', [id]);
        console.debug('[History] Data deactivated:', result);
    } catch (error) {
        console.error('[History] Error deactivating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteHistory(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM historia WHERE id = ?', [id]);
        console.debug('[History] Data deleted:', result);
    } catch (error) {
        console.error('[History] Error deleting data:', error);
    } finally {
        db.end();
    }
}