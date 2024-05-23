export interface ContactInfo {
    name: string;
    icon: string;
    text: string;
    additionalText: string;
    active: boolean;
}

export interface ContactInfoWithId extends ContactInfo {
    id: number;
}