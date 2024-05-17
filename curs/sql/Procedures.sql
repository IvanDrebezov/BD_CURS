
----------ROLES-------------- 
CREATE OR REPLACE PROCEDURE CREATE_ROLE(
role_name IN VARCHAR2)
IS
BEGIN
INSERT INTO ROLES(ROLE_NAME)values(role_name);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_ROLE(
role_id IN NUMBER)
IS
BEGIN
DELETE FROM ROLES WHERE role_id = role_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_ROLE(
role_id IN NUMBER,
role_name IN VARCHAR2)
IS
BEGIN
UPDATE ROLES SET role_name = role_name WHERE role_id = role_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;


------------USERS-------------
CREATE OR REPLACE PROCEDURE CREATE_USER(
user_name IN VARCHAR2,
user_email IN VARCHAR2,
user_password IN VARCHAR2,
user_role IN NUMBER)
is 
begin
insert into USERS (user_name, user_email, user_password, user_role)
values (user_name, user_email, user_password, user_role);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_USER(
user_id IN NUMBER)
IS
BEGIN
DELETE FROM USERS WHERE user_id = user_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_USER(
user_id IN NUMBER,
user_name IN VARCHAR2,
user_email IN VARCHAR2,
user_password IN VARCHAR2,
user_role IN NUMBER)
IS
BEGIN
UPDATE USERS SET 
user_name = user_name,  
user_email = user_email,
user_password = user_password,
user_role = user_role
WHERE user_id = user_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

-------Collections---
CREATE OR REPLACE PROCEDURE CREATE_COLLECTION(
creator_id IN NUMBER,
collection_name IN VARCHAR2,
description IN VARCHAR2)
is 
begin
insert into COLLECTIONS (creator_id,collection_name,description)
values (creator_id,collection_name,description);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_COLLECTION(
collection_id IN NUMBER)
IS
BEGIN
DELETE FROM COLLECTIONS WHERE collection_id = collection_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_COLLECTION(
collection_id IN NUMBER,
collection_name IN VARCHAR2,
description IN VARCHAR2)
IS
BEGIN
UPDATE COLLECTIONS SET 
collection_name = collection_name,
description = description
WHERE collection_id = collection_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

----------BOOKS-----------
CREATE OR REPLACE PROCEDURE CREATE_BOOK(
creator_id in number,
book_name in VARCHAR2,
book_publish_date in DATE,
description in varchar2)
is 
begin
insert into BOOKS (creator_id, book_name, book_publish_date, description)
values (creator_id, book_name, book_publish_date, description);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_BOOK(
book_id IN NUMBER)
IS
BEGIN
DELETE FROM BOOKS WHERE book_id = book_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_BOOK(
book_id in number,
book_name in VARCHAR2,
description in varchar2)
is 
begin
UPDATE BOOKS SET   
book_name = book_name,
description = description
WHERE book_id = book_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

--------CHAPTERS--------
CREATE OR REPLACE PROCEDURE CREATE_CHAPTER(
    book_id IN NUMBER,
    chapter_name IN VARCHAR2,
    chapter_content IN VARCHAR2,
    chapter_publish_date IN DATE,
    chapter_num IN NUMBER)
is 
begin
insert into CHAPTERS (book_id,chapter_name ,chapter_content, chapter_publish_date, chapter_num)
values (book_id,chapter_name ,chapter_content, chapter_publish_date, chapter_num);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_CHAPTER(
chapter_id IN NUMBER)
IS
BEGIN
DELETE FROM CHAPTERS WHERE chapter_id = chapter_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_CHAPTER(
chapter_id IN NUMBER,
    chapter_name IN VARCHAR2,
    chapter_content IN VARCHAR2,
    chapter_num IN NUMBER)
is 
begin
UPDATE CHAPTERS SET
chapter_name = chapter_name,
chapter_content = chapter_content,
chapter_num = chapter_num
WHERE chapter_id = chapter_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

-------COMMENTS-------
CREATE OR REPLACE PROCEDURE CREATE_COMMENT(
    chapter_id IN NUMBER,
    user_id IN NUMBER,
    comment_content IN VARCHAR2,
    comment_publish_date IN DATE)
is 
begin
insert into COMMENTS (chapter_id ,user_id ,comment_content ,comment_publish_date)
values (chapter_id ,user_id ,comment_content ,comment_publish_date);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_COMMENT(
comment_id IN NUMBER)
IS
BEGIN
DELETE FROM COMMENTS WHERE comment_id = comment_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_COMMENT(
comment_id IN NUMBER,
comment_content IN VARCHAR2)
is 
begin
UPDATE COMMENTS SET 
comment_content = comment_content  
WHERE comment_id = comment_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

-------GENRES_TYPES------
CREATE OR REPLACE PROCEDURE CREATE_GENRES_TYPE(
genre_name IN VARCHAR2)
IS
BEGIN
INSERT INTO GENRES_TYPES(genre_name)values(genre_name);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_GENRES_TYPE(
genre_id IN NUMBER)
IS
BEGIN
DELETE FROM GENRES_TYPES WHERE genre_id = genre_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_GENRES_TYPE(
genre_id IN NUMBER,
genre_name IN VARCHAR2)
IS
BEGIN
UPDATE GENRES_TYPES SET genre_name = genre_name WHERE genre_id = genre_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

-------BOOKS_GENRES------
CREATE OR REPLACE PROCEDURE CREATE_BOOKS_GENRE(
genre_id IN NUMBER,
book_id IN NUMBER)
IS
BEGIN
INSERT INTO BOOKS_GENRES(genre_id ,book_id)values(genre_id ,book_id);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_BOOKS_GENRE(
book_genre_id IN NUMBER)
IS
BEGIN
DELETE FROM BOOKS_GENRES WHERE book_genre_id = book_genre_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_BOOKS_GENRE(
book_genre_id IN NUMBER,
genre_id IN NUMBER,
book_id IN NUMBER)
IS
BEGIN
UPDATE BOOKS_GENRES SET genre_id = genre_id , book_id=book_id 
WHERE book_genre_id = book_genre_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

-------BOOKS_COLLECTIONS------
CREATE OR REPLACE PROCEDURE CREATE_BOOKS_COLLECTION(
collection_id IN NUMBER,
book_id IN NUMBER)
IS
BEGIN
INSERT INTO BOOKS_COLLECTIONS(collection_id ,book_id)
values(collection_id ,book_id);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE DELETE_BOOKS_COLLECTION(
book_collection_id IN NUMBER)
IS
BEGIN
DELETE FROM BOOKS_COLLECTIONS WHERE book_collection_id = book_collection_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE UPDATE_BOOKS_COLLECTION(
book_collection_id IN NUMBER,
collection_id IN NUMBER,
book_id IN NUMBER)
IS
BEGIN
UPDATE BOOKS_COLLECTIONS SET collection_id = collection_id , book_id=book_id 
WHERE book_collection_id = book_collection_id;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;
