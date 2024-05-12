import {Request, Response} from 'express';

export const getMaintenanceInfo = (req: Request, res: Response) => {
    res.json({
        message: 'This is the maintenance info endpoint.'
    });
};
