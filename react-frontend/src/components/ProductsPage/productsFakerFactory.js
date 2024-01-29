
import { faker } from "@faker-js/faker";
export default (count,nameIds) => {
    let data = [];
    for (let i = 0; i < count; i++) {
        const fake = {
name: nameIds[i % nameIds.length],

        };
        data = [...data, fake];
    }
    return data;
};
