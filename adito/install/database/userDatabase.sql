//
// Roles
//

CREATE CACHED TABLE ROLES
(
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

CREATE UNIQUE INDEX SYS_IDX_ROLES_CONSTRAINT ON ROLES
(
  ROLENAME,
  REALM_ID
);

INSERT INTO ROLES (ROLENAME, REALM_ID) VALUES ('Users',1);


//
// Users
//

CREATE CACHED TABLE USERS
(
   USERNAME VARCHAR(255) not null,
   EMAIL VARCHAR(255) not null,
   FULLNAME VARCHAR(255) not null,
   LAST_PASSWORD_CHANGE DATE,
   PASSWORD VARCHAR(100),
   REALM_ID INTEGER
);

CREATE UNIQUE INDEX SYS_IDX_USERS_CONSTRAINT ON USERS
(
  USERNAME,
  REALM_ID
);


//
// User roles
//

CREATE CACHED TABLE USER_ROLES
(
   USERNAME VARCHAR(255) not null,
   ROLENAME VARCHAR(255) not null,
   REALM_ID INTEGER
);

CREATE UNIQUE INDEX SYS_IDX_USER_ROLES_CONSTRAINT ON USER_ROLES
(
  USERNAME,
  ROLENAME,
  REALM_ID
);