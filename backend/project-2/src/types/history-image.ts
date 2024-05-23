export interface HistoryImage {
    historyId: number;
    imageId: number;
}

export interface HistoryImageWithId extends HistoryImage {
    id: number;
}