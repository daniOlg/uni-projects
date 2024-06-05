import {Router} from 'express';

import {getImage} from "../controllers/image";

const router = Router();

/**
 * @openapi
 * /get-image:
 *   get:
 *     summary: Retrieve an image
 *     description: Retrieve an image from the database. Can be used to display an image when prototyping or testing an API.
 */
router.get('/get-image', getImage);

export default router;