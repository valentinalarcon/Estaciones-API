import pg from 'pg';

const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    password: 'admin',
    database: 'EstacionApi',
    port: '5432'
})

export default pool;