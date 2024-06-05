import {Router} from 'express';

import {getContactInfo} from "../controllers/contact-info";

const router = Router();

/**
 * @openapi
 * /contact-info:
 *   get:
 *     summary: Retrieve contact information
 *     description: Retrieve contact information from the database. Can be used to display contact information when prototyping or testing an API.
 */
router.get('/contact-info', getContactInfo);

export default router;