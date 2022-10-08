INSERT INTO languages_tab (iso_code, name) VALUES ('fr', 'France'); /*to insert new row into the table*/
INSERT INTO languages_tab (iso_code, name) VALUES ('pl', 'Polish');

SELECT * FROM languages_tab;

-- SQL for movie_tab
SELECT * FROM movie_tab;
INSERT INTO movie_tab (id, name) VALUES (1, 'Interstellar');
INSERT INTO movie_tab (name) VALUES ('Dune'); /*  even if we do not specify insert in "id" column, 
                                            it will be incremented automatically given by the "autoincrement" function */
INSERT INTO movie_tab (name, description) VALUES ('Harry Potter', 'Really good movie!!');

SELECT * FROM movie_tab;

-- SQL for languages_tab
DELETE FROM languages_tab; /*before upload the .csv (since it contains some information equal to the ones we inserted earlier)
                            we need to delete this information from the tab otherwise we get an error */
                            
SELECT * FROM languages_tab;