CREATE TABLE usuario (
	id_user serial not NULL,
	nome varchar(255) not NULL,
	senha varchar(20) not NULL,
	email varchar(50) not NULL,
	CONSTRAINT pk_user PRIMARY KEY(id_user)
);

CREATE TABLE quadro (
	id_quadro serial not NULL,
	id_user INT not NULL,
	nome varchar(255) not NULL,
	descricao TEXT,
	visibilidade char(20) not NULL,
	data_criacao DATE not NULL,
	CONSTRAINT pk_quadro PRIMARY KEY(id_quadro),
	FOREIGN KEY (id_user) REFERENCES usuario (id_user)
		ON DELETE CASCADE
 		ON UPDATE CASCADE
);

CREATE TABLE tarefa (
	id_tarefa serial not NULL,
	id_quadro int not NULL,
	id_user int not NULL,
	titulo varchar(255) not NULL,
	descricao TEXT,
	categoria char(20),
	data_criacao DATE not NULL,
	data_vencimento DATE not NULL,
	prioridade char(20),
	status char(20),
	CONSTRAINT pk_tarefa PRIMARY KEY(id_tarefa),
	FOREIGN KEY (id_quadro) REFERENCES quadro (id_quadro) 
		ON DELETE CASCADE
 		ON UPDATE CASCADE,
	FOREIGN KEY (id_user) REFERENCES usuario (id_user) 
		ON DELETE CASCADE
 		ON UPDATE CASCADE
);

CREATE TABLE anotacao (
	id_anot serial not NULL,
	id_user int not NULL,
	id_tarefa int not NULL,
	descricao TEXT,
	data_criacao DATE not NULL,
	CONSTRAINT pk_anot PRIMARY KEY(id_anot),
	FOREIGN KEY (id_user) REFERENCES usuario (id_user)
		ON DELETE CASCADE
 		ON UPDATE CASCADE,
	FOREIGN KEY (id_tarefa) REFERENCES tarefa (id_tarefa)
		ON DELETE CASCADE
 		ON UPDATE CASCADE
);

