CREATE TABLE worker (
                        ID BIGINT PRIMARY KEY AUTO_INCREMENT,
                        NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) BETWEEN 2 AND 1000),
                        BIRTHDAY DATE NOT NULL CHECK (YEAR(BIRTHDAY) > 1900),
                        LEVEL VARCHAR(10) NOT NULL CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior')),
                        SALARY INT NOT NULL CHECK (SALARY BETWEEN 100 AND 100000)
);

CREATE TABLE client (
                        ID BIGINT PRIMARY KEY AUTO_INCREMENT,
                        NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) BETWEEN 2 AND 1000)
);

CREATE TABLE project (
                         ID BIGINT PRIMARY KEY AUTO_INCREMENT,
                         CLIENT_ID BIGINT NOT NULL,
                         START_DATE DATE NOT NULL,
                         FINISH_DATE DATE,
                         FOREIGN KEY (CLIENT_ID) REFERENCES client(ID)
);

CREATE TABLE project_worker (
                                PROJECT_ID BIGINT NOT NULL,
                                WORKER_ID BIGINT NOT NULL,
                                PRIMARY KEY (PROJECT_ID, WORKER_ID),
                                FOREIGN KEY (PROJECT_ID) REFERENCES project(ID),
                                FOREIGN KEY (WORKER_ID) REFERENCES worker(ID)
);
