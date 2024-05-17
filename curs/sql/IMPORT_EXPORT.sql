CREATE OR REPLACE PROCEDURE BOOKS_XML IS
    xml_data CLOB;
BEGIN
    SELECT XMLELEMENT("BOOKS",
XMLFOREST(book_id as "book_id",creator_id as "creator_id",book_name as "book_name",book_publish_date as "book_publish_date",description as "description")).getClobVal()
    INTO xml_data
    FROM BOOKS
    WHERE ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE(xml_data);
END;

CALL BOOKS_XML();

CREATE OR REPLACE Procedure import_xml_book
(xml_text in nvarchar2) is
  v_xml XMLType;
BEGIN
  v_xml := XMLType(xml_text);
  CREATE_BOOK(v_xml.extract('/BOOKS/creator_id/text()').getNumberVal(),
          v_xml.extract('/BOOKS/book_name/text()').getStringVal(),
          TO_DATE(v_xml.extract('/BOOKS/book_publish_date/text()').getStringVal(),'J'),
          v_xml.extract('/BOOKS/description/text()').getStringVal());
END;
