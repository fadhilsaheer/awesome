import { MikroORM } from '@mikro-orm/core';
import { __prod__ } from './constants';
import { Post } from './entitiesn/Post';


const main =  async () => {
    const orm = await MikroORM.init({
        dbName: 'lirredit',
        type: 'postgresql',
        entities: [Post],
        user: 'postgres',
        password: 'root',
        debug: !__prod__,
    });

    const post = orm.em.create(Post, {title: 'hello world'});
    await orm.em.persistAndFlush(post);
    

};

main();
