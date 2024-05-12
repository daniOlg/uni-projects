import {Router} from 'express';
import {getMaintenanceInfo} from '../controllers/maintenance-info';
import {root} from "../controllers/root";

const router = Router();

// Routes
router.get('/maintenance-info', getMaintenanceInfo);

// TODO: Implement the following routes
// router.get('/service-category', getMaintenanceInfo);
// router.get('/contact-info', getMaintenanceInfo);
// router.get('/history', getMaintenanceInfo);
// router.get('/team', getMaintenanceInfo);
// router.get('/faq', getMaintenanceInfo);

// Get all routes in the root of the API
const routes: string[] = router.stack.map(r => r.route.path);
router.get('/', (req, res) => root(req, res, routes));

export default router;