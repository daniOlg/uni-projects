export interface Image {
    name: string;
    image: string;
    active: boolean;
}

export interface ImageWithId extends Image {
    id: number;
}