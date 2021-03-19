import { __prod__ } from "./constants";
import { Post } from "./entitiesn/Post";

export default {
    dbName: 'lirredit',
    type: 'postgresql',
    entities: [Post],
    user: 'postgres',
    password: 'root',
    debug: !__prod__,
}