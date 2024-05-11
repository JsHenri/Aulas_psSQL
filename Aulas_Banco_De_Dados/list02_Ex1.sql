--Exercicio 1: Biblioteca.

--A
CREATE TABLE livros (
	id_livro SERIAL PRIMARY KEY,
	isbn varchar(20),
	titulo text,
	editora text,
	ano_de_publicação varchar(4),
	autorPrimeiroNome text,
	autorUltimoNome text
);

CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	autorPrimeiroNome text,
	autorUltimoNome text
);

CREATE TABLE biblioteca (
	idbiblioteca SERIAL PRIMARY KEY,
	
	id_livro int,
	CONSTRAINT fk_livro FOREIGN KEY (id_livro) REFERENCES livros (id_livro),
	
	id_autor int,
	CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
);

SELECT * FROM biblioteca

INSERT INTO livros (id_livro,isbn,titulo,editora,ano_de_publicação,autorPrimeiroNome,autorUltimoNome) VALUES
(10,'021-03-2025-063-1','O Pequeno Príncipe','Grupo Companhia das Letras','1943','Antoine','de Saint-Exupéry'),
(11,'415-21-3140-521-2','Diário de um Banana','New York Times','2007','Jeff','Kinney'),
(12,'403-55-3678-136-3','Harry Potter','Rocco','1997','J. K.','Rowling'),
(13,'953-23-5865-246-4','A Cabana','Arqueiro','2007','William','P.'),
(14,'441-11-3560-145-5','A Culpa é das Estrelas','Intrínseca','2012','John','Green'),
(15,'561-46-2718-361-6','Dom Casmurro','Thoth','1899','Machado','de Assis');


INSERT INTO autores (id_autor,autorPrimeiroNome,autorUltimoNome) VALUES
(4,'Antoine','de Saint-Exupéry'),
(5,'Jeff','Kinney'),
(6,'J. K.','Rowling'),
(7,'William','P.'),
(8,'John','Green'),
(9,'Machado','de Assis');

DROP TABLE livros

SELECT * FROM livros

--B
SELECT livros.titulo, autores.autorPrimeiroNome FROM autores INNER JOIN livros USING (autorPrimeiroNome)
WHERE livros.autorPrimeiroNome = 'J. K.'