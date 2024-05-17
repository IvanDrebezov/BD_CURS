begin
ctx_ddl.create_preference('books_lexer', 'BASIC_LEXER');  
ctx_ddl.set_attribute('books_lexer', 'mixed_case', 'NO'); 
ctx_ddl.create_preference('books_datastore', 'MULTI_COLUMN_DATASTORE'); 
ctx_ddl.set_attribute('books_datastore', 'columns', 'book_name, description');
end;

create index be_name_idx on books (book_name) indextype is ctxsys.context parameters 
('datastore books_datastore lexer books_lexer')

select * from BOOKS where CONTAINS(book_name, '%JYosZGkQux%') > 1