import {Router} from 'express';

import {getHistoryImage} from "../controllers/history-image";

const router = Router();

/**
 * @openapi
 * /history-image:
 *   get:
 *     summary: Retrieve an image related to a history item
 *     description: Retrieve an image related to a history item from the database. Can be used to display an image related to a history item when prototyping or testing an API.
 */
router.get('/history-image', getHistoryImage);

export default router;