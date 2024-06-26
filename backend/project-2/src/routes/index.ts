import {Router} from 'express';
import {root} from "../controllers/root";

import maintenanceInfo from "./maintenance-info";
import serviceCategory from "./service-category";
import contactInfo from "./contact-info";
import getImage from "./get-image";
import history from "./history";
import historyImage from "./history-image";

const router = Router();

// Routes
router.use(maintenanceInfo);
router.use(serviceCategory);
router.use(contactInfo);
router.use(getImage);
router.use(history);
router.use(historyImage);

// TODO: Implement the following routes
// router.get('/team', getMaintenanceInfo);
// router.get('/faq', getMaintenanceInfo);

// Get all routes in the root of the API
const _routes = router.stack.map(r => r.handle.stack.map((r: any) => r.route)).flat();
const routes = _routes.filter((r: any) => Object.keys(r.methods).includes('get')).map((r: any) => r.path);
router.get('/', (req, res) => root(req, res, routes));

export default router;