import {Router} from 'express';
import {getServiceCategory} from "../controllers/service-category";

const router = Router();

/**
 * @openapi
 * /service-category:
 *   get:
 *     summary: Retrieve a list of service categories
 *     description: Retrieve a list of service categories from the database. Can be used to populate a list of service categories when prototyping or testing an API.
 */
router.get('/service-category', getServiceCategory);

export default router;