export interface MaintenanceInfo {
    name: string;
    text: string;
    active: boolean;
}

export interface MaintenanceInfoWithId extends MaintenanceInfo {
    id: number;
}