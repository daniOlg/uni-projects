import {Request, Response} from 'express';
import {getAllHistoryImages} from "../services/history-image";

export const getHistoryImage = async (req: Request, res: Response) => {
    const data = await getAllHistoryImages();
    res.json(data);
};
