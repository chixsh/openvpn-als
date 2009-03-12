// 
// Policies
//

CREATE CACHED TABLE POLICY
(
   ID INT GENERATED BY DEFAULT AS IDENTITY (START WITH 0, INCREMENT BY 1) NOT NULL ,
   POLICY_TYPE_ID INTEGER not null,
   POLICY_NAME VARCHAR(2147483647),
   POLICY_DESCRIPTION VARCHAR(2147483647),
   DATE_CREATED TIMESTAMP,
   DATE_AMENDED TIMESTAMP,
   REALM_ID INTEGER DEFAULT 1
);

INSERT INTO POLICY (POLICY_TYPE_ID,POLICY_NAME,POLICY_DESCRIPTION,DATE_CREATED,DATE_AMENDED) VALUES (0,'Everyone','This special system-wide policy includes all users and roles by default. You can neither delete this policy nor change the principals attached.',NOW(),NOW());


CREATE CACHED TABLE POLICY_PRINCIPAL_RELATIONSHIP
(
   POLICY_ID INTEGER not null,
   PRINCIPAL_ID VARCHAR(2147483647) not null,
   PRINCIPAL_TYPE INTEGER not null,
   CONSTRAINT POLICY_PRINCIPAL_RELATIONSHIP_PK PRIMARY KEY (POLICY_ID,PRINCIPAL_ID,PRINCIPAL_TYPE)
);


CREATE CACHED TABLE POLICY_RESOURCE_RELATIONSHIP
(
   RESOURCE_ID INTEGER not null,
   POLICY_ID INTEGER not null,
   RESOURCE_TYPE INTEGER not null,
   SEQUENCE INTEGER,
   REALM_ID INTEGER,
   CONSTRAINT POLICY_RESOURCE_RELATIONSHIP_PK PRIMARY KEY (RESOURCE_ID,RESOURCE_TYPE,POLICY_ID,REALM_ID)
);

INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (0,0,1,1);
INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (1,0,6,1);
INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (1,0,1003,1);
INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (2,0,1003,1);
INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (3,0,1003,1);
INSERT INTO POLICY_RESOURCE_RELATIONSHIP (RESOURCE_ID,POLICY_ID,RESOURCE_TYPE,REALM_ID) VALUES (4,0,1003,1);


CREATE CACHED TABLE RESOURCE_PERMISSION
(
   RESOURCE_ID INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL ,
   RESOURCE_CLASS VARCHAR(2147483647) not null,
   RESOURCE_NAME VARCHAR(2147483647) not null,
   RESOURCE_DESCRIPTION VARCHAR(2147483647) not null,
   DATE_CREATED TIMESTAMP,
   DATE_AMENDED TIMESTAMP,
   REALM_ID INTEGER DEFAULT 1
);

INSERT INTO RESOURCE_PERMISSION (RESOURCE_CLASS,RESOURCE_NAME,RESOURCE_DESCRIPTION,DATE_CREATED,DATE_AMENDED) VALUES ('personal','Global Permissions','These permissions are granted to all users by default through the use of the Everyone policy.',NOW(),NOW());


CREATE CACHED TABLE RESOURCE_PERMISSION_PERMISSIONS
(
   RESOURCE_PERMISSION_ID INTEGER not null,
   RESOURCE_TYPE_ID VARCHAR(2147483647) not null,
   PERMISSION_ID VARCHAR(2147483647) not null,
   CONSTRAINT RESOURCE_PERMISSION_PERMISSIONS_PK PRIMARY KEY (RESOURCE_PERMISSION_ID,RESOURCE_TYPE_ID,PERMISSION_ID)
);

INSERT INTO RESOURCE_PERMISSION_PERMISSIONS (RESOURCE_PERMISSION_ID,RESOURCE_TYPE_ID,PERMISSION_ID) VALUES (1,'2001','14');
INSERT INTO RESOURCE_PERMISSION_PERMISSIONS (RESOURCE_PERMISSION_ID,RESOURCE_TYPE_ID,PERMISSION_ID) VALUES (1,'2002','9');
INSERT INTO RESOURCE_PERMISSION_PERMISSIONS (RESOURCE_PERMISSION_ID,RESOURCE_TYPE_ID,PERMISSION_ID) VALUES (1,'2004','15');
INSERT INTO RESOURCE_PERMISSION_PERMISSIONS (RESOURCE_PERMISSION_ID,RESOURCE_TYPE_ID,PERMISSION_ID) VALUES (1,'2006','14');