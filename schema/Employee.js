cube(`Employee`, {
  sql: `SELECT * FROM employee`,
  joins: {
    PhoneNumber: {
      sql: `${CUBE}.id = ${PhoneNumber}.employee_id`,
      relationship: `hasMany`
    }
  },
  dimensions: {

    name: {
      sql: `name`,
      type: `string`
    },

    secondName: {
      sql: `second_name`,
      type: `string`
    },

    patronymic: {
      sql: `patronymic`,
      type: `string`
    },

    position: {
      sql: `position`,
      type: `string`
    },

    initials: {
      sql: `
        CONCAT(${CUBE.secondName}, ' ',
        LEFT(${CUBE.name}, 1), '.',
        LEFT(${CUBE.patronymic},1)
      )`,
      type: `string`
    }
  }
})