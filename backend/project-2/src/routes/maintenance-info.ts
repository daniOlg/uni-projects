import {Router} from 'express';
import {
    getMaintenanceInfo,
    insertMaintenanceInfo,
    updateMaintenanceInfo,
    activateMaintenanceInfo,
    deactivateMaintenanceInfo
} from '../controllers/maintenance-info';

const router = Router();

/**
 * @openapi
 * /maintenance-info:
 *   get:
 *     summary: Retrieve a list of maintanance types
 *     description: Retrieve a list of maintanance types from the database. Can be used to populate a list of maintanance types when prototyping or testing an API.
 */
router.get('/maintenance-info', getMaintenanceInfo);

/**
 * @openapi
 * /maintenance-info:
 *   post:
 *     summary: Insert a new maintanance type
 *     description: Insert a new maintanance type into the database. Can be used when adding a new maintanance type to the database.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               text:
 *                 type: string
 *               active:
 *                 type: boolean
 *           example:
 *             name: "Mantenimiento de prueba"
 *             text: "Este es un mantenimiento de prueba"
 *             active: true
 */
router.post('/maintenance-info', insertMaintenanceInfo);

/**
 * @openapi
 * /maintenance-info:
 *   put:
 *     summary: Update a maintanance type
 *     description: Update a maintanance type in the database. Can be used when updating an existing maintanance type in the database.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id:
 *                 type: number
 *               name:
 *                 type: string
 *               text:
 *                 type: string
 *               active:
 *                 type: boolean
 *           example:
 *             id: 1
 *             name: "Mantenimiento de prueba"
 *             text: "Este es un mantenimiento de prueba"
 *             active: true
 */
router.put('/maintenance-info', updateMaintenanceInfo);

/**
 * @openapi
 * /maintenance-info:
 *   patch:
 *     summary: Activate a maintanance type
 *     description: Activate a maintanance type in the database. Can be used when activating an existing maintanance type in the database.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id:
 *                 type: number
 *           example:
 *             id: 1
 */
router.patch('/maintenance-info', activateMaintenanceInfo);

/**
 * @openapi
 * /maintenance-info:
 *   delete:
 *     summary: Deactivate a maintanance type
 *     description: Deactivate a maintanance type in the database. Can be used when deactivating an existing maintanance type in the database.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               id:
 *                 type: number
 *           example:
 *             id: 1
 */
router.delete('/maintenance-info', deactivateMaintenanceInfo);

export default router;