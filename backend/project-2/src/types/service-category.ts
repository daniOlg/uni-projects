export interface ServiceCategory {
    name: string;
    image: string;
    text: string;
    active: boolean;
}

export interface ServiceCategoryWithId extends ServiceCategory {
    id: number;
}
