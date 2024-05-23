import connect from './db';
import {MaintenanceInfo, MaintenanceInfoWithId} from "../types/maintenance-info";

export async function getAllMaintenanceInfo() {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM mantenimiento_info');
    return rows;
}

export async function getMaintenanceInfoById(id: number) {
    const db = await connect();

    const [rows] = await db.execute('SELECT * FROM mantenimiento_info WHERE id = ?', [id]);
    return rows;
}

export async function insertMaintenanceInfo({name, text, active}: MaintenanceInfo) {
    const db = await connect();

    try {
        const [result] = await db.execute('INSERT INTO mantenimiento_info (nombre, texto, activo) VALUES (?, ?, ?)', [name, text, active]);
        console.debug('[Maintenance] Data inserted:', result);
    } catch (error) {
        console.error('[Maintenance] Error inserting data:', error);
    } finally {
        db.end();
    }
}

export async function updateMaintenanceInfo({id, name, text, active}: MaintenanceInfoWithId) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE mantenimiento_info SET nombre = ?, texto = ?, activo = ? WHERE id = ?', [name, text, active, id]);
        console.debug('[Maintenance] Data updated:', result);
    } catch (error) {
        console.error('[Maintenance] Error updating data:', error);
    } finally {
        db.end();
    }
}


export async function activateMaintenanceInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE mantenimiento_info SET activo = true WHERE id = ?', [id]);
        console.debug('[Maintenance] Data activated:', result);
    } catch (error) {
        console.error('[Maintenance] Error activating data:', error);
    } finally {
        db.end();
    }
}

export async function deactivateMaintenanceInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('UPDATE mantenimiento_info SET activo = false WHERE id = ?', [id]);
        console.debug('[Maintenance] Data deactivated:', result);
    } catch (error) {
        console.error('[Maintenance] Error deactivating data:', error);
    } finally {
        db.end();
    }
}

export async function deleteMaintenanceInfo(id: number) {
    const db = await connect();

    try {
        const [result] = await db.execute('DELETE FROM mantenimiento_info WHERE id = ?', [id]);
        console.debug('[Maintenance] Data deleted:', result);
    } catch (error) {
        console.error('[Maintenance] Error deleting data:', error);
    } finally {
        db.end();
    }
}