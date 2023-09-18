DROP TABLE IF EXISTS "myTable";

CREATE TABLE "myTable" (
  id SERIAL PRIMARY KEY,
  hdate varchar(255),
  eid integer NULL,
  temperature integer NULL
);

INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',1,38),
  ('Nov 1, 2021',2,42),
  ('Nov 1, 2021',3,40),
  ('Nov 1, 2021',4,39),
  ('Nov 1, 2021',5,34),
  ('Nov 1, 2021',6,38),
  ('Nov 1, 2021',7,35),
  ('Nov 1, 2021',8,42),
  ('Nov 1, 2021',9,36),
  ('Nov 1, 2021',10,36);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',11,35),
  ('Nov 1, 2021',12,41),
  ('Nov 1, 2021',13,36),
  ('Nov 1, 2021',14,35),
  ('Nov 1, 2021',15,42),
  ('Nov 1, 2021',16,42),
  ('Nov 1, 2021',17,43),
  ('Nov 1, 2021',18,42),
  ('Nov 1, 2021',19,38),
  ('Nov 1, 2021',20,41);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',21,34),
  ('Nov 1, 2021',22,39),
  ('Nov 1, 2021',23,40),
  ('Nov 1, 2021',24,35),
  ('Nov 1, 2021',25,34),
  ('Nov 1, 2021',26,39),
  ('Nov 1, 2021',27,35),
  ('Nov 1, 2021',28,40),
  ('Nov 1, 2021',29,40),
  ('Nov 1, 2021',30,37);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',31,37),
  ('Nov 1, 2021',32,40),
  ('Nov 1, 2021',33,36),
  ('Nov 1, 2021',34,36),
  ('Nov 1, 2021',35,40),
  ('Nov 1, 2021',36,42),
  ('Nov 1, 2021',37,42),
  ('Nov 1, 2021',38,41),
  ('Nov 1, 2021',39,39),
  ('Nov 1, 2021',40,40);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',41,41),
  ('Nov 1, 2021',42,39),
  ('Nov 1, 2021',43,35),
  ('Nov 1, 2021',44,36),
  ('Nov 1, 2021',45,42),
  ('Nov 1, 2021',46,42),
  ('Nov 1, 2021',47,40),
  ('Nov 1, 2021',48,36),
  ('Nov 1, 2021',49,34),
  ('Nov 1, 2021',50,39);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',51,40),
  ('Nov 1, 2021',52,37),
  ('Nov 1, 2021',53,37),
  ('Nov 1, 2021',54,41),
  ('Nov 1, 2021',55,38),
  ('Nov 1, 2021',56,36),
  ('Nov 1, 2021',57,38),
  ('Nov 1, 2021',58,39),
  ('Nov 1, 2021',59,39),
  ('Nov 1, 2021',60,34);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',61,40),
  ('Nov 1, 2021',62,35),
  ('Nov 1, 2021',63,37),
  ('Nov 1, 2021',64,37),
  ('Nov 1, 2021',65,41),
  ('Nov 1, 2021',66,39),
  ('Nov 1, 2021',67,41),
  ('Nov 1, 2021',68,40),
  ('Nov 1, 2021',69,36),
  ('Nov 1, 2021',70,34);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',71,39),
  ('Nov 1, 2021',72,38),
  ('Nov 1, 2021',73,34),
  ('Nov 1, 2021',74,41),
  ('Nov 1, 2021',75,40),
  ('Nov 1, 2021',76,39),
  ('Nov 1, 2021',77,41),
  ('Nov 1, 2021',78,37),
  ('Nov 1, 2021',79,42),
  ('Nov 1, 2021',80,43);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',81,36),
  ('Nov 1, 2021',82,39),
  ('Nov 1, 2021',83,37),
  ('Nov 1, 2021',84,39),
  ('Nov 1, 2021',85,40),
  ('Nov 1, 2021',86,37),
  ('Nov 1, 2021',87,38),
  ('Nov 1, 2021',88,39),
  ('Nov 1, 2021',89,42),
  ('Nov 1, 2021',90,37);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',91,37),
  ('Nov 1, 2021',92,36),
  ('Nov 1, 2021',93,39),
  ('Nov 1, 2021',94,43),
  ('Nov 1, 2021',95,39),
  ('Nov 1, 2021',96,35),
  ('Nov 1, 2021',97,36),
  ('Nov 1, 2021',98,41),
  ('Nov 1, 2021',99,38),
  ('Nov 1, 2021',100,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',101,35),
  ('Nov 1, 2021',102,38),
  ('Nov 1, 2021',103,42),
  ('Nov 1, 2021',104,42),
  ('Nov 1, 2021',105,34),
  ('Nov 1, 2021',106,35),
  ('Nov 1, 2021',107,35),
  ('Nov 1, 2021',108,41),
  ('Nov 1, 2021',109,34),
  ('Nov 1, 2021',110,39);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',111,41),
  ('Nov 1, 2021',112,42),
  ('Nov 1, 2021',113,40),
  ('Nov 1, 2021',114,41),
  ('Nov 1, 2021',115,42),
  ('Nov 1, 2021',116,36),
  ('Nov 1, 2021',117,38),
  ('Nov 1, 2021',118,41),
  ('Nov 1, 2021',119,37),
  ('Nov 1, 2021',120,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',121,40),
  ('Nov 1, 2021',122,35),
  ('Nov 1, 2021',123,40),
  ('Nov 1, 2021',124,35),
  ('Nov 1, 2021',125,41),
  ('Nov 1, 2021',126,42),
  ('Nov 1, 2021',127,35),
  ('Nov 1, 2021',128,42),
  ('Nov 1, 2021',129,40),
  ('Nov 1, 2021',130,39);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',131,38),
  ('Nov 1, 2021',132,38),
  ('Nov 1, 2021',133,40),
  ('Nov 1, 2021',134,38),
  ('Nov 1, 2021',135,42),
  ('Nov 1, 2021',136,39),
  ('Nov 1, 2021',137,34),
  ('Nov 1, 2021',138,37),
  ('Nov 1, 2021',139,41),
  ('Nov 1, 2021',140,40);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',141,36),
  ('Nov 1, 2021',142,40),
  ('Nov 1, 2021',143,38),
  ('Nov 1, 2021',144,36),
  ('Nov 1, 2021',145,41),
  ('Nov 1, 2021',146,38),
  ('Nov 1, 2021',147,37),
  ('Nov 1, 2021',148,42),
  ('Nov 1, 2021',149,38),
  ('Nov 1, 2021',150,43);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',151,40),
  ('Nov 1, 2021',152,42),
  ('Nov 1, 2021',153,34),
  ('Nov 1, 2021',154,35),
  ('Nov 1, 2021',155,40),
  ('Nov 1, 2021',156,43),
  ('Nov 1, 2021',157,37),
  ('Nov 1, 2021',158,37),
  ('Nov 1, 2021',159,34),
  ('Nov 1, 2021',160,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',161,35),
  ('Nov 1, 2021',162,36),
  ('Nov 1, 2021',163,37),
  ('Nov 1, 2021',164,42),
  ('Nov 1, 2021',165,40),
  ('Nov 1, 2021',166,38),
  ('Nov 1, 2021',167,42),
  ('Nov 1, 2021',168,42),
  ('Nov 1, 2021',169,37),
  ('Nov 1, 2021',170,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',171,39),
  ('Nov 1, 2021',172,40),
  ('Nov 1, 2021',173,35),
  ('Nov 1, 2021',174,42),
  ('Nov 1, 2021',175,37),
  ('Nov 1, 2021',176,36),
  ('Nov 1, 2021',177,34),
  ('Nov 1, 2021',178,35),
  ('Nov 1, 2021',179,39),
  ('Nov 1, 2021',180,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',181,39),
  ('Nov 1, 2021',182,42),
  ('Nov 1, 2021',183,38),
  ('Nov 1, 2021',184,41),
  ('Nov 1, 2021',185,34),
  ('Nov 1, 2021',186,39),
  ('Nov 1, 2021',187,42),
  ('Nov 1, 2021',188,41),
  ('Nov 1, 2021',189,43),
  ('Nov 1, 2021',190,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 1, 2021',191,35),
  ('Nov 1, 2021',192,41),
  ('Nov 1, 2021',193,42),
  ('Nov 1, 2021',194,35),
  ('Nov 1, 2021',195,38),
  ('Nov 1, 2021',196,40),
  ('Nov 1, 2021',197,35),
  ('Nov 1, 2021',198,36),
  ('Nov 1, 2021',199,35),
  ('Nov 1, 2021',200,38);
