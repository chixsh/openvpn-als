DROP TABLE PERSONAL_ANSWERS

ALTER TABLE FAVORITES ADD COLUMN REALM_ID INTEGER DEFAULT 1;

CREATE CACHED TABLE FAVORITES_TMP
(
   FAVORITE_ID INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL ,
   USERNAME VARCHAR(2147483647),
   FAVORITE_KEY INTEGER,
   TYPE INTEGER,
   REALM_ID INTEGER
);

CREATE UNIQUE INDEX SYS_IDX_FAVORITES_TMP_5 ON FAVORITES_TMP
(
  USERNAME,
  FAVORITE_KEY,
  TYPE,
  REALM_ID
);

INSERT INTO FAVORITES_TMP (FAVORITE_ID,USERNAME,FAVORITE_KEY,TYPE,REALM_ID) SELECT * FROM FAVORITES;

DROP TABLE FAVORITES IF EXISTS;

CREATE CACHED TABLE FAVORITES
(
   FAVORITE_ID INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL ,
   USERNAME VARCHAR(2147483647),
   FAVORITE_KEY INTEGER,
   TYPE INTEGER,
   REALM_ID INTEGER
);

CREATE UNIQUE INDEX SYS_IDX_FAVORITES_6 ON FAVORITES
(
  USERNAME,
  FAVORITE_KEY,
  TYPE,
  REALM_ID
);

INSERT INTO FAVORITES (FAVORITE_ID,USERNAME,FAVORITE_KEY,TYPE,REALM_ID) SELECT * FROM FAVORITES_TMP;

DROP TABLE FAVORITES_TMP IF EXISTS;

// upgrade anyone who doesnt have a fallback ip restriction

ALTER TABLE IP_RESTRICTIONS ADD COLUMN PRIORITY INTEGER;
UPDATE IP_RESTRICTIONS SET PRIORITY = RESTRICTION_ID;
INSERT INTO IP_RESTRICTIONS ('ADDRESS', 'TYPE') VALUES  ('*.*.*.*', 2);
DELETE FROM IP_RESTRICTIONS WHERE (SELECT COUNT(*) FROM IP_RESTRICTIONS) <> 1 AND ADDRESS = '*.*.*.*'

ALTER TABLE AUTH_SCHEMES ADD COLUMN REALM_ID INTEGER DEFAULT 1;
