cube(`CallInfo`, {
  sql: `SELECT * FROM call_info`,
  
  preAggregations: {
    // Pre-Aggregations definitions go here
    // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started  
  },
  
  joins: {
    
  },
  
  measures: {
    count: {
      type: `count`,
    },
    countMissed: {
      type: `count`,
      filters: [
        { sql: `status = 'missed'` }
      ]
    },
    avgDuration: {
      type: `avg`,
      sql: `duration`
    }
  },
  
  dimensions: {
    duration: {
      sql: `duration`,
      type: `string`
    },
    
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true
    },
    
    incomePhone: {
      sql: `income_phone`,
      type: `string`
    },
    
    outcomePhone: {
      sql: `outcome_phone`,
      type: `string`
    },
    
    status: {
      sql: `status`,
      type: `string`
    },
    
    type: {
      sql: `type`,
      type: `string`
    },
    
    startDate: {
      sql: `start_date`,
      type: `time`
    }
  },
  
  dataSource: `default`
});
