cube(`PhoneNumber`, {
  sql: `SELECT * FROM phone_number`,

  joins: {
    Employee: {
      sql: `${CUBE}.employee_id = ${Employee}.id`,
      relationship: `belongsTo`
    },
    CallInfo: {
      sql: `${CUBE}.phone = ${CallInfo}.income_phone`,
      relationship: `hasMany`
    }
  },
  
  measures: {
    count: {
      type: `count`,
      drillMembers: [id]
    }
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    phone: {
      sql: `phone`,
      type: `string`
    }
  },
  
  dataSource: `default`
});
