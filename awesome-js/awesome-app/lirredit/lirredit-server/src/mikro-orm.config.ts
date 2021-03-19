import { __prod__ } from "./constants";
import { Post } from "./entitiesn/Post";
import { MikroORM } from '@mikro-orm/core';

export default {
    entities: [Post],
    dbName: 'lirredit',
    type: 'postgresql',
    user: 'postgres',
    password: 'root',
    debug: !__prod__,
} as Parameters<typeof MikroORM.init>[0];