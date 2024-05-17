CREATE OR REPLACE TRIGGER CHECK_USER_CREATE_COLLECTION
BEFORE INSERT ON COLLECTIONS
FOR EACH ROW
DECLARE
ROLE_NUM NUMBER(10);
BEGIN
  SELECT user_role
    INTO ROLE_NUM
    FROM USERS
    WHERE USERS.user_id = :new.creator_id;
  IF ROLE_NUM != 2 THEN
    RAISE_APPLICATION_ERROR(-20001, 'wrong user');
  END IF;
END;

CREATE OR REPLACE TRIGGER CHECK_USER_CREATE_BOOK
BEFORE INSERT ON BOOKS
FOR EACH ROW
DECLARE
ROLE_NUM NUMBER(10);
BEGIN
  SELECT user_role
    INTO ROLE_NUM
    FROM USERS
    WHERE USERS.user_id = :new.creator_id;
  IF ROLE_NUM != 1 THEN
    RAISE_APPLICATION_ERROR(-20001, 'wrong user');
  END IF;
END;


CREATE OR REPLACE TRIGGER CHECK_CHAPTER_NUM
BEFORE INSERT ON CHAPTERS
FOR EACH ROW
DECLARE
CH_NUM NUMBER(10);
CH_LAST_NUM NUMBER(10);
BEGIN
  SELECT COUNT(*)
    INTO CH_NUM
    FROM CHAPTERS
    WHERE CHAPTERS.book_id = :new.book_id AND CHAPTERS.chapter_num = :new.chapter_num; 
  SELECT MAX(chapter_num)
    INTO CH_LAST_NUM
    FROM CHAPTERS
    WHERE CHAPTERS.book_id = :new.book_id;
  IF CH_NUM != 0 THEN
    IF CH_LAST_NUM != NULL OR CH_LAST_NUM != 0 THEN
    :NEW.chapter_num := CH_LAST_NUM + 1;
    ELSE 
    :NEW.chapter_num := 1;
    END IF;
  END IF;
END;


CREATE OR REPLACE TRIGGER CHECK_CHAPTER_DATE
BEFORE INSERT ON CHAPTERS
FOR EACH ROW
DECLARE
BOOK_DATE DATE;
BEGIN
  SELECT book_publish_date
    INTO BOOK_DATE
    FROM BOOKS
    WHERE BOOKS.book_id = :new.book_id;
  IF :new.chapter_publish_date < BOOK_DATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'wrong date');
  END IF;
END;


CREATE OR REPLACE TRIGGER CHECK_COMMENT_DATE
BEFORE INSERT ON COMMENTS
FOR EACH ROW
DECLARE
CHAPTER_DATE DATE;
BEGIN
  SELECT chapter_publish_date
    INTO CHAPTER_DATE
    FROM CHAPTERS
    WHERE CHAPTERS.chapter_id = :new.chapter_id;
  IF :new.comment_publish_date < CHAPTER_DATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'wrong date');
  END IF;
END;


CREATE OR REPLACE TRIGGER CHECK_BOOKS_GENRES
BEFORE INSERT ON BOOKS_GENRES
FOR EACH ROW
DECLARE
NUM_C NUMBER(10);
BEGIN
  SELECT COUNT(*)
    INTO NUM_C
    FROM BOOKS_GENRES
    WHERE BOOKS_GENRES.genre_id = :new.genre_id AND BOOKS_GENRES.book_id = :new.book_id;
  IF NUM_C != 0 OR NUM_C != NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'ALREDY EXIST');
  END IF;
END;


CREATE OR REPLACE TRIGGER CHECK_BOOKS_COLLECTIONS
BEFORE INSERT ON BOOKS_COLLECTIONS
FOR EACH ROW
DECLARE
NUM_C NUMBER(10);
BEGIN
  SELECT COUNT(*)
    INTO NUM_C
    FROM BOOKS_COLLECTIONS
    WHERE BOOKS_COLLECTIONS.collection_id = :new.collection_id AND BOOKS_COLLECTIONS.book_id = :new.book_id;
  IF NUM_C != 0 OR NUM_C != NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'ALREDY EXIST');
  END IF;
END;