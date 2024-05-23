import {Request, Response} from 'express';
import {getAllMaintenanceInfo} from "../services/maintenance-info";
import {getAllImages} from "../services/image";

export const getImage = async (req: Request, res: Response) => {
    const data = await getAllImages()
    res.json(data);
};
