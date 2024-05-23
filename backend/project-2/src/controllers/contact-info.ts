import {Request, Response} from 'express';
import {getAllContactInfo} from "../services/contact-info";

export const getContactInfo = async (req: Request, res: Response) => {
    const data = await getAllContactInfo();
    res.json(data);
};
