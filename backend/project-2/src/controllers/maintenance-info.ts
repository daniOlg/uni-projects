import {Request, Response} from 'express';
import {getAllMaintenanceInfo} from "../services/maintenance-info";

export const getMaintenanceInfo = async (req: Request, res: Response) => {
    const data = await getAllMaintenanceInfo()
    res.json(data);
};
