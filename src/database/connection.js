import pg from 'pg';

const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    password: 'admin',
    database: 'ad',
    port: '5432'
})

export default pool;