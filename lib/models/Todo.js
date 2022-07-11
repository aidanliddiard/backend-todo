const pool = require('../utils/pool');

module.exports = class Todo {
  id;
  item;
  done;
  user_id;

  constructor(row) {
    this.id = row.id;
    this.item = row.item;
    this.done = row.done;
    this.user_id = row.user_id;
  }

  static async insert({ item, user_id }) {
    const { rows } = await pool.query(
      `
    INSERT INTO todos (item, user_id)
    VALUES ($1, $2)
    RETURNING *`,
      [item, user_id]
    );
    return new Todo(rows[0]);
  }
};
