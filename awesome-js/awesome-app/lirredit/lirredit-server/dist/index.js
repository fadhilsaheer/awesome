"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@mikro-orm/core");
const constants_1 = require("./constants");
const Post_1 = require("./entitiesn/Post");
const main = () => __awaiter(void 0, void 0, void 0, function* () {
    const orm = yield core_1.MikroORM.init({
        dbName: 'lirredit',
        type: 'postgresql',
        entities: [Post_1.Post],
        user: 'postgres',
        password: 'root',
        debug: !constants_1.__prod__,
    });
    const post = orm.em.create(Post_1.Post, { title: 'hello world' });
    yield orm.em.persistAndFlush(post);
});
main().catch(err => {
    console.log(err);
});
//# sourceMappingURL=index.js.map