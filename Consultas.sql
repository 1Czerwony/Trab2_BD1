-- 1) Seleção de arma do tipo leve
SELECT * FROM arma WHERE tipo = 'Leve';

-- 2) Seleção e projeção das descrições de todas as classes
SELECT descricao FROM classe;

-- 3) União das tabelas de cada classe
SELECT idclasse, deuses AS caract1, simbSagrados AS caract2, magiasCura AS magias, bonusFe AS bonus FROM clerigo UNION SELECT * FROM mago UNION SELECT * FROM barbaro UNION SELECT * FROM arqueiro;

-- 4) Seleção das habilidade com custo menor que 500 -- EXCEPT não existe no MYSQL
-- SELECT nome, custo FROM habilidade EXCEPT SELECT custo FROM habilidade WHERE custo<500;

-- 5) Seleção das habilidades portadas por alguma classe -- INTERSECT não existe no MYSQL
-- SELECT idhabilidade FROM habilidade INTERSECT SELECT idhab FROM portar;

-- 6) Seleção de armas que foram ofertadas para pelo menos uma classe
SELECT idarma, nome FROM arma WHERE idarma IN (SELECT DISTINCT idarma FROM ofertar);

-- 7)
SELECT idhabilidade, nome FROM habilidade WHERE idhabilidade NOT IN (SELECT DISTINCT idhab FROM portar); -- Habilidades que não são portadas por nenhuma classe
SELECT descricao FROM classe WHERE idclasse = ANY (SELECT idclasse FROM mago); -- Descrição das classes em que o id da classe está presente na tabela mago
SELECT nome FROM personagem WHERE EXISTS (SELECT tagUser FROM usuario WHERE tagUser = 4321); -- Nomes dos personagens possuídos pelo usuário com a tag 4321
SELECT * FROM recursos WHERE idrecurso = ALL (SELECT idrec FROM deter); -- Características de um único recurso detido por todos as classes

-- 8) Nome dos personagens em que sua especie possui menos de 2m de altura e sua classe porta a habilidade 1
SELECT nome FROM personagem 
WHERE (idesp, idclasse) = ANY
	(SELECT DISTINCT a.idespecie, b.idclasse 
	FROM (SELECT * FROM especie WHERE altura<2.00) AS a 
	INNER JOIN (SELECT * FROM portar WHERE idhab=1) AS b);

-- 9) Recursos e habilidades que se relacionam com cada classe
SELECT * FROM deter RIGHT OUTER JOIN portar ON deter.idclasse=portar.idclasse;

-- 10) Junção dos personagens aos seus respectivos usuários
SELECT * FROM personagem LEFT OUTER JOIN usuario ON tag=tagUser;

-- 11)	Média dos atributos dos personagens
SELECT AVG(carisma) AS "Media Carisma", AVG(forca) AS "Media Forca", AVG(inteligencia) AS "Media Inteligência", AVG(fe) AS "Media Fe" FROM personagem;

-- 12) Para cada habilidade, lista a quantidade de classes com quem se relaciona
SELECT idhab, COUNT(idclasse) AS "Quantidade de Classes" FROM portar GROUP BY idhab;

-- 13) Nome da espécie, a quantidade de vezes em que ela aparece e sua média de altura
SELECT nome, COUNT(nome) AS Quantidade, AVG(altura) AS "Média de Altura" FROM especie GROUP BY nome;

-- 14) Quantidade de armas de todos os tipos exceto o tipo "Pesada"
SELECT tipo, COUNT(tipo) AS Quantidade FROM arma GROUP BY tipo HAVING tipo != 'Pesada'; 

-- 15) Lista todos os personagens de cada usuário e suas respectivas espécies
SELECT usuario.login AS usuario, personagem.nome AS nome_personagem, especie.nome AS nome_especie FROM 
((personagem INNER JOIN usuario ON tagUser=tag) 
INNER JOIN especie ON idesp=idespecie); 

-- 16) Para cada personagem, lista sua respectiva arma, recurso e habilidade
SELECT personagem.nome AS personagem, ofertar.idarma, deter.idrec, portar.idhab FROM 
(((personagem INNER JOIN ofertar ON personagem.idclasse=ofertar.idclasse)
INNER JOIN deter ON personagem.idclasse=deter.idclasse)
INNER JOIN portar ON personagem.idclasse=portar.idclasse); 

-- 17) Para cada personagem, lista sua montaria e a habilidade de sua arma
SELECT DISTINCT personagem.nome AS personagem, recursos.montaria, arma.habilidade AS arma FROM 
((((personagem INNER JOIN deter ON personagem.idclasse=deter.idclasse)
INNER JOIN recursos ON idrec=idrecurso)
INNER JOIN ofertar ON personagem.idclasse=ofertar.idclasse)
INNER JOIN arma ON ofertar.idarma=arma.idarma);
