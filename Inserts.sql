INSERT INTO usuario VALUES (1234, 'vitor', 321), (4321, 'joao', 123), (4567, 'jose', 555);

INSERT INTO especie
VALUES (2384, 1.50, 3, 255, 304, 'humano'), (9234, 2.50, 5, 240, 255, 'elfo'), 
(9475, 2.10, 6, 105, 234, 'elfo'), (8274, 1.91, 1, 92, 100, 'ogro');

INSERT INTO classe
VALUES (1111, 'Mago: um usuário de magia erudito capaz de manipular as estruturas da realidade'),
(2222, 'Bárbaro: guerreiro feroz que pode entrar em fúria de batalha'),
(3333, 'Arqueiro: exímios atiradores, capazes de mirar e acertar seus inimigos com flechas mortais'),
(4444, 'Clérigo: campeão sacerdotal que exerce magia divina a serviço de um poder superior'),
(5555, 'Necromancer: magos que possuem domínio dos mortos e magia negra');

INSERT INTO mago
VALUES (1111, 'Ansuz, Thurisaz', 'Grimório de Asta', 'Fogo, Gelo, Maldição', 10),
(5555, 'Eolh, Peorth', 'Necronomicon', 'Enfraquecimento, Horda dos Mortos, Corrupção', 10);
INSERT INTO barbaro
VALUES (2222, 'tangas de aço temeriano', 'tanquinho de cobre élfico', 'Fúria, Tormenta de fogo, Abalo Císmico', 10);
INSERT INTO arqueiro
VALUES (3333, 'Lobo Furtivo', 'Visão de Águia', 'Fungos Alucinógenos', 10);
INSERT INTO clerigo
VALUES (4444, 'Yorixiriamori', 'Filtro dos Sonhos, Mokas', 'Reflorescer, Passáro Cantante', 10);

INSERT INTO personagem
VALUES (2347, 'Czerwony', 5, 10, 15, 5, 4321, 9234, 1111), (8394, 'Vitulito', 10, 11, 4, 10, 1234, 8274, 4444),
(3928, 'Reden', 15, 5, 10, 5, 4321, 2384, 2222), (8931, '2ez4starlord', 5, 9, 16, 5, 4567, 9475, 3333);

INSERT INTO arma
VALUES (1, 'Leve', 'Perfurante', 'Destreza', 'Arremesso', 'Adaga'),
(2, 'Pesada', 'Cortante', 'Forca', 'Duas Mãos', 'Machado Grande'),
(3, 'Pesada', 'Concussão', 'Forca', 'Duas Mãos', 'Malho'),
(4, 'Média', 'Mágica', 'Magia', 'Uma mão', 'Bastão Mágico'),
(5, 'Média', 'Distancia', 'Precisão', 'Duas Mãos', 'Arco Curvo');

INSERT INTO habilidade
VALUES (1, 'Poção de cura', '+100 Vida', 150),
(2, 'Poção de Mana', '+80 Mana', 100),
(3, 'Investida', '100 Dano', 500),
(4, 'Chuva de Meteoros', '300 Dano', 1000);

INSERT INTO ofertar
VALUES (2, 2222, 50), (4, 4444, 40), (4, 1111, 80), (5, 3333, 60);

INSERT INTO portar
VALUES (1, 2222), (2, 1111), (4, 4444), (1, 3333);

INSERT INTO recursos
VALUES (1, 500, 'Cavalo Preto', 'Aço Temeriano'),
(2, 400, 'Grifo', 'Manto Sagrado'),
(3, 550, 'Cavalo Branco', 'Aço Élfico');

INSERT INTO deter
VALUES (1, 2222), (1, 3333), (1, 4444), (1, 1111);