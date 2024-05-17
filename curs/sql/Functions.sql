CREATE OR REPLACE FUNCTION show_users_books (p_user_name IN USERS.user_name%TYPE) RETURN sys_refcursor
IS
    ord_cursor sys_refcursor;
    rcount INT;
    id_u NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO rcount
    FROM USERS
    WHERE USERS.user_name = p_user_name;
    IF rcount = 1 THEN
    SELECT user_id
    INTO id_u
    FROM USERS
    WHERE USERS.user_name = p_user_name;
        OPEN ord_cursor FOR
        SELECT creator_id, book_name, book_publish_date, description
        FROM BOOKS
        WHERE creator_id = id_u; 
        RETURN ord_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('проверьте данные.');
        RETURN NULL;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ошибка '||SQLCODE);
        RETURN NULL;
END;


CREATE OR REPLACE FUNCTION check_authentication (p_user_name IN USERS.user_name%TYPE, p_password IN USERS.user_password%TYPE) RETURN boolean
IS 
num_c NUMBER;
BEGIN
SELECT COUNT(*)
INTO num_c
FROM USERS
WHERE USERS.user_name = p_user_name and USERS.user_password = p_password;
IF num_c < 1 or num_c = null then
return false;
else 
return true;
end if;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ошибка '||SQLCODE);
        RETURN NULL;
end;


