begin 
CREATE_ROLE('Writter');
CREATE_ROLE('Reader');
CREATE_ROLE('Admin');
end;

ALTER SESSION SET DB_FILE_MULTIBLOCK_READ_COUNT=128;
ALTER SESSION SET SORT_AREA_SIZE=500000000;
ALTER SESSION SET SORT_AREA_RETAINED_SIZE=500000000;
set serveroutput on size unlimited 


DECLARE
     j NUMBER;
    user_name USERS.user_name%TYPE;
    user_email USERS.user_email%TYPE;
    user_password USERS.user_password%TYPE;
    user_role USERS.user_role%TYPE;
BEGIN
     FOR j IN 1..1000 LOOP
    user_name := DBMS_RANDOM.STRING('A', 5); 
    user_email := DBMS_RANDOM.STRING('A', 10);          
    user_role := DBMS_RANDOM.VALUE(1, 3);       
    user_password := DBMS_RANDOM.STRING('A', 20);       
    CREATE_USER(user_name, user_email, user_password, user_role);
    END LOOP;
end;


DECLARE
     j NUMBER;
    creator_id COLLECTIONS.creator_id%TYPE;
    collection_name COLLECTIONS.collection_name%TYPE;
    description COLLECTIONS.description%TYPE;
BEGIN
     FOR j IN 1..1000 LOOP          
    creator_id := DBMS_RANDOM.VALUE(1, 1000);       
    collection_name := DBMS_RANDOM.STRING('A', 20); 
    description:= DBMS_RANDOM.STRING('A', 20); 
    CREATE_COLLECTION(creator_id,collection_name,description);
    END LOOP;
end;


DECLARE
     j NUMBER;
    creator_id BOOKS.creator_id%TYPE;
    book_name BOOKS.book_name%TYPE;
    book_publish_date BOOKS.book_publish_date%TYPE;
    description COLLECTIONS.description%TYPE;
BEGIN
     FOR j IN 1..5000 LOOP          
    creator_id := DBMS_RANDOM.VALUE(1, 1000);       
    book_name := DBMS_RANDOM.STRING('A', 20); 
    description:= DBMS_RANDOM.STRING('A', 30); 
    book_publish_date:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'),TO_CHAR(DATE '2023-12-31','J'))),'J');
    CREATE_BOOK(creator_id, book_name, book_publish_date, description);
    END LOOP;
end;


DECLARE
     j NUMBER;
    book_id CHAPTERS.book_id%TYPE;
    chapter_name CHAPTERS.chapter_name%TYPE;
    chapter_content CHAPTERS.chapter_content%TYPE;
    chapter_publish_date CHAPTERS.chapter_publish_date%TYPE;
BEGIN
     FOR j IN 1..1000000 LOOP          
    book_id := DBMS_RANDOM.VALUE(1, 5000);       
    chapter_name := DBMS_RANDOM.STRING('A', 10); 
    chapter_content:= DBMS_RANDOM.STRING('A', 30); 
    chapter_publish_date:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'),TO_CHAR(DATE '2023-12-31','J'))),'J');
    CREATE_CHAPTER(book_id,chapter_name ,chapter_content, chapter_publish_date, 1);
    END LOOP;
end;



DECLARE
     j NUMBER;
    chapter_id COMMENTS.chapter_id%TYPE;
    user_id COMMENTS.user_id%TYPE;
    comment_content COMMENTS.comment_content%TYPE;
    comment_publish_date COMMENTS.comment_publish_date%TYPE;
BEGIN
     FOR j IN 1..5000 LOOP          
    chapter_id := DBMS_RANDOM.VALUE(1, 1000000);
    user_id := DBMS_RANDOM.VALUE(1, 1000);
    comment_content:= DBMS_RANDOM.STRING('A', 30); 
    comment_publish_date:= TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J'),TO_CHAR(DATE '2023-12-31','J'))),'J');
    CREATE_COMMENT(chapter_id ,user_id ,comment_content ,comment_publish_date);
    END LOOP;
end;


DECLARE
     j NUMBER;
     genre_name GENRES_TYPES.genre_name%TYPE;
BEGIN
     FOR j IN 1..1000 LOOP          
    genre_name:= DBMS_RANDOM.STRING('A', 10); 
    CREATE_GENRES_TYPE(genre_name);
    END LOOP;
end;


DECLARE
     j NUMBER;
     genre_id BOOKS_GENRES.genre_id%TYPE;
     book_id BOOKS_GENRES.book_id%TYPE;
BEGIN
     FOR j IN 1..10000 LOOP          
    genre_id:= DBMS_RANDOM.VALUE(1, 1000); 
    book_id:= DBMS_RANDOM.VALUE(1, 5000); 
    CREATE_BOOKS_GENRE(genre_id ,book_id);
    END LOOP;
end;


DECLARE
     j NUMBER;
     collection_id BOOKS_COLLECTIONS.collection_id%TYPE;
     book_id BOOKS_COLLECTIONS.book_id%TYPE;
BEGIN
     FOR j IN 1..10000 LOOP          
    collection_id:= DBMS_RANDOM.VALUE(1, 1000); 
    book_id:= DBMS_RANDOM.VALUE(1, 1000); 
    CREATE_BOOKS_COLLECTION(collection_id ,book_id);
    END LOOP;
end;
