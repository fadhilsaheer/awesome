import { MikroORM } from '@mikro-orm/core';
import { __prod__ } from './constants';
import { Post } from './entitiesn/Post';
import microConfig from './mikro-orm.config';

const main =  async () => {
    const orm = await MikroORM.init(microConfig);
    await orm.getMigrator().up(); // run migrator before creating post
    const post = orm.em.create(Post, {title: 'hello world'});
    await orm.em.persistAndFlush(post);

};

main().catch(err => {
    console.log(err);
})
