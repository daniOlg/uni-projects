export interface History {
    type: string;
    text: string;
    active: boolean;
}

export interface HistoryWithId extends History {
    id: number;
}