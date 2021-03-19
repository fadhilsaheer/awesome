"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const constants_1 = require("./constants");
const Post_1 = require("./entitiesn/Post");
exports.default = {
    dbName: 'lirredit',
    type: 'postgresql',
    entities: [Post_1.Post],
    user: 'postgres',
    password: 'root',
    debug: !constants_1.__prod__,
};
//# sourceMappingURL=mikro-orm.config.js.map