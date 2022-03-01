create table call_info
(
    id            int auto_increment primary key,
    type          enum ('income', 'outcome')                                         not null,
    income_phone  varchar(12)                                                        not null,
    outcome_phone varchar(12)                                                        not null,
    status        enum ('success', 'missed', 'busy', 'not_available', 'not_allowed') not null,
    duration      float                                                              not null,
    start_date    datetime                                                           null
);
create table employee
(
    id          int auto_increment primary key,
    name        varchar(255)            not null,
    second_name varchar(255) default '' not null,
    patronymic  varchar(255) default '' not null,
    position    varchar(255) default '' not null
);
create table phone_number
(
    id          int auto_increment
        primary key,
    phone       varchar(12) not null,
    employee_id int         not null,
    constraint phone_number_ibfk_1
        foreign key (employee_id) references employee (id)
);

INSERT INTO vats_call (type, income_phone, outcome_phone, status, duration, start_date)
VALUES ('income', '+79999990001', '79999999999', 'success', 10, '2022-01-01'),
       ('income', '+79999990001', '79999999999', 'missed', 0, '2022-01-01'),
       ('income', '+79999990001', '79999999999', 'busy', 0, '2022-01-01'),
       ('income', '+79999990002', '79999999999', 'success', 20, '2022-01-01'),
       ('income', '+79999990002', '79999999999', 'missed', 0, '2022-01-01'),
       ('income', '+79999990002', '79999999999', 'busy', 0, '2022-01-01'),
       ('income', '+79999990001', '79999999999', 'success', 10, '2022-01-02'),
       ('income', '+79999990001', '79999999999', 'success', 20, '2022-01-02'),
       ('income', '+79999990001', '79999999999', 'success', 30, '2022-01-02'),
       ('income', '+79999990002', '79999999999', 'missed', 0, '2022-01-02'),
       ('income', '+79999990002', '79999999999', 'missed', 0, '2022-01-02'),
       ('income', '+79999990002', '79999999999', 'missed', 0, '2022-01-02')
