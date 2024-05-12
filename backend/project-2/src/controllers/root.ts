import {Request, Response} from 'express';

export const root = (req: Request, res: Response, routes: string[]) => {
    const endpointPrefix = `${req.protocol}://${req.get('host')}${req.originalUrl}`;

    res.json({
        endpoints: routes.map(route => `${endpointPrefix}${route}`)
    });
};