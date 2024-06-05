import {Request, Response} from 'express';
import {
    getAllMaintenanceInfo,
    insertMaintenanceInfo as insMaintenanceInfo,
    updateMaintenanceInfo as updMaintenanceInfo,
    activateMaintenanceInfo as actMaintenanceInfo,
    deactivateMaintenanceInfo as deactMaintenanceInfo
} from "../services/maintenance-info";

export const getMaintenanceInfo = async (req: Request, res: Response) => {
    const data = await getAllMaintenanceInfo()
    res.json(data);
};

export const insertMaintenanceInfo = async (req: Request, res: Response) => {
    const {name, text, active} = req.body;

    await insMaintenanceInfo({
        name,
        text,
        active
    });
    res.json({message: 'Data inserted'});
};

export const updateMaintenanceInfo = async (req: Request, res: Response) => {
    const {id, name, text, active} = req.body;

    await updMaintenanceInfo({
        id,
        name,
        text,
        active
    });
    res.json({message: 'Data updated'});
};

export const activateMaintenanceInfo = async (req: Request, res: Response) => {
    const {id} = req.body;

    await actMaintenanceInfo(id);
    res.json({message: 'Data activated'});
}

export const deactivateMaintenanceInfo = async (req: Request, res: Response) => {
    const {id} = req.body;

    await deactMaintenanceInfo(id);
    res.json({message: 'Data deactivated'});
}