import {Request, Response} from 'express';
import {getAllMaintenanceInfo} from "../services/maintenance-info";
import {getAllImages} from "../services/image";
import {getAllHistory} from "../services/history";

export const getHistory = async (req: Request, res: Response) => {
    const data = await getAllHistory();
    res.json(data);
};
