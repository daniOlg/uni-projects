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
 *     summary: Get all maintanance types
 *     description: Get all maintanance types from the database. Can be used when getting all maintanance types from the database.
 *     responses:
 *       200:
 *         description: A list of all maintanance types.
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: number
 *                   name:
 *                     type: string
 *                   text:
 *                     type: string
 *                   active:
 *                     type: boolean
 *                 example:
 *                   - id: 1
 *                     name: "Mantenimiento"
 *                     text: "Conjunto de operaciones y cuidados necesarios para que tus instalaciones continúen funcionando correctamente."
 *                     active: true
 *                   - id: 2
 *                     name: "Mantenimiento Preventivo"
 *                     text: "Ayuda a prolongar la vida útil de tus activos y aumenta la productividad, a través de una revisión."
 *                     active: true
 *                   - id: 3
 *                     name: "Mantenimiento Correctivo"
 *                     text: "Corrige problemas o daños en las instalaciones o equipos."
 *                     active: true
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
 *     responses:
 *        200:
 *          description: Data inserted
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *              example:
 *                message: Data inserted
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
 *     responses:
 *        200:
 *          description: Data updated
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *              example:
 *                message: Data updated
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
 *     responses:
 *        200:
 *          description: Data activated
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *              example:
 *                message: Data activated
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
 *     responses:
 *        200:
 *          description: Data deactivated
 *          content:
 *            application/json:
 *              schema:
 *                type: object
 *                properties:
 *                  message:
 *                    type: string
 *              example:
 *                message: Data deactivated
 */
router.delete('/maintenance-info', deactivateMaintenanceInfo);

export default router;