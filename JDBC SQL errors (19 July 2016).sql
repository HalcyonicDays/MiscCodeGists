--SQL Issue, 19 July 2016

SELECT
   S1."USERNAME" AS "USERNAME",
   S1."COMMENT_BODY" AS "COMMENTBODY"
FROM
   "DATABASE"."USER_COMMENTS" S1;

-- The above works.

INSERT INTO "DATABASE"."USER_COMMENTS"
   (USERNAME,
   COMMENT_BODY)
VALUES
   ('Test.User.Me', 
   'Test Comment');
SELECT
   S1."USERNAME" AS "USERNAME",
   S1."COMMENT_BODY" AS "COMMENTBODY"
FROM
   "DATABASE"."USER_COMMENTS" S1;

-- The above throws an error:
-- [Oracle JDBC Driver][Oracle]ORA-00911: invalid character

INSERT INTO "DATABASE"."USER_COMMENTS"
   ([USERNAME],
   [COMMENT_BODY])
VALUES
   ('Test.User.Me', 
   'Test Comment');
SELECT
   S1."USERNAME" AS "USERNAME",
   S1."COMMENT_BODY" AS "COMMENTBODY"
FROM
   "DATABASE"."USER_COMMENTS" S1;

-- The above throws an error:
-- [Oracle JDBC Driver][Oracle]ORA-00928: missing SELECT keyword
 
INSERT INTO "DATABASE"."USER_COMMENTS"
 ("USERNAME" AS "USERNAME",
  "COMMENT_BODY" AS "COMMENTBODY")
VALUES
 (%CURRENT_USER%,
  ?Comment);
SELECT
   S1."USERNAME" AS "USERNAME",
   S1."COMMENT_BODY" AS "COMMENTBODY"
FROM
   "DATABASE"."USER_COMMENTS" S1;

-- The above throws an error:
-- [Oracle JDBC Driver][Oracle]ORA-00917: missing comma
