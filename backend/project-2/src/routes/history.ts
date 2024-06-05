import {Router} from 'express';

import {getHistory} from "../controllers/history";

const router = Router();

/**
 * @openapi
 * /history:
 *   get:
 *     summary: Retrieve a list of history items
 *     description: Retrieve a list of history items from the database. Can be used to populate a list of history items when prototyping or testing an API.
 */
router.get('/history', getHistory);

export default router;