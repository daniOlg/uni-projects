import {Request, Response} from 'express';
import {getAllServiceCategories} from "../services/service-category";

export const getServiceCategory = async (req: Request, res: Response) => {
    const data = await getAllServiceCategories();
    res.json(data);
};
