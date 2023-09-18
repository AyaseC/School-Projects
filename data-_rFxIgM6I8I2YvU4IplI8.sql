DROP TABLE IF EXISTS "myTable";

CREATE TABLE "myTable" (
  id SERIAL PRIMARY KEY,
  hdate varchar(255),
  eid integer NULL,
  temperature integer NULL
);

INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',1,40),
  ('Nov 2, 2021',2,39),
  ('Nov 2, 2021',3,43),
  ('Nov 2, 2021',4,36),
  ('Nov 2, 2021',5,35),
  ('Nov 2, 2021',6,37),
  ('Nov 2, 2021',7,42),
  ('Nov 2, 2021',8,36),
  ('Nov 2, 2021',9,34),
  ('Nov 2, 2021',10,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',11,42),
  ('Nov 2, 2021',12,34),
  ('Nov 2, 2021',13,37),
  ('Nov 2, 2021',14,43),
  ('Nov 2, 2021',15,36),
  ('Nov 2, 2021',16,36),
  ('Nov 2, 2021',17,37),
  ('Nov 2, 2021',18,35),
  ('Nov 2, 2021',19,36),
  ('Nov 2, 2021',20,37);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',21,41),
  ('Nov 2, 2021',22,34),
  ('Nov 2, 2021',23,41),
  ('Nov 2, 2021',24,43),
  ('Nov 2, 2021',25,41),
  ('Nov 2, 2021',26,34),
  ('Nov 2, 2021',27,35),
  ('Nov 2, 2021',28,35),
  ('Nov 2, 2021',29,37),
  ('Nov 2, 2021',30,40);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',31,39),
  ('Nov 2, 2021',32,36),
  ('Nov 2, 2021',33,36),
  ('Nov 2, 2021',34,38),
  ('Nov 2, 2021',35,40),
  ('Nov 2, 2021',36,37),
  ('Nov 2, 2021',37,41),
  ('Nov 2, 2021',38,42),
  ('Nov 2, 2021',39,43),
  ('Nov 2, 2021',40,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',41,42),
  ('Nov 2, 2021',42,41),
  ('Nov 2, 2021',43,36),
  ('Nov 2, 2021',44,43),
  ('Nov 2, 2021',45,41),
  ('Nov 2, 2021',46,37),
  ('Nov 2, 2021',47,35),
  ('Nov 2, 2021',48,38),
  ('Nov 2, 2021',49,35),
  ('Nov 2, 2021',50,39);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',51,34),
  ('Nov 2, 2021',52,37),
  ('Nov 2, 2021',53,35),
  ('Nov 2, 2021',54,39),
  ('Nov 2, 2021',55,35),
  ('Nov 2, 2021',56,39),
  ('Nov 2, 2021',57,38),
  ('Nov 2, 2021',58,38),
  ('Nov 2, 2021',59,34),
  ('Nov 2, 2021',60,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',61,41),
  ('Nov 2, 2021',62,40),
  ('Nov 2, 2021',63,36),
  ('Nov 2, 2021',64,43),
  ('Nov 2, 2021',65,34),
  ('Nov 2, 2021',66,39),
  ('Nov 2, 2021',67,37),
  ('Nov 2, 2021',68,40),
  ('Nov 2, 2021',69,43),
  ('Nov 2, 2021',70,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',71,37),
  ('Nov 2, 2021',72,38),
  ('Nov 2, 2021',73,39),
  ('Nov 2, 2021',74,42),
  ('Nov 2, 2021',75,42),
  ('Nov 2, 2021',76,39),
  ('Nov 2, 2021',77,36),
  ('Nov 2, 2021',78,34),
  ('Nov 2, 2021',79,43),
  ('Nov 2, 2021',80,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',81,39),
  ('Nov 2, 2021',82,37),
  ('Nov 2, 2021',83,35),
  ('Nov 2, 2021',84,36),
  ('Nov 2, 2021',85,37),
  ('Nov 2, 2021',86,36),
  ('Nov 2, 2021',87,39),
  ('Nov 2, 2021',88,38),
  ('Nov 2, 2021',89,37),
  ('Nov 2, 2021',90,41);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',91,36),
  ('Nov 2, 2021',92,35),
  ('Nov 2, 2021',93,35),
  ('Nov 2, 2021',94,40),
  ('Nov 2, 2021',95,37),
  ('Nov 2, 2021',96,35),
  ('Nov 2, 2021',97,34),
  ('Nov 2, 2021',98,39),
  ('Nov 2, 2021',99,35),
  ('Nov 2, 2021',100,36);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',101,41),
  ('Nov 2, 2021',102,36),
  ('Nov 2, 2021',103,38),
  ('Nov 2, 2021',104,38),
  ('Nov 2, 2021',105,38),
  ('Nov 2, 2021',106,41),
  ('Nov 2, 2021',107,41),
  ('Nov 2, 2021',108,36),
  ('Nov 2, 2021',109,40),
  ('Nov 2, 2021',110,34);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',111,40),
  ('Nov 2, 2021',112,36),
  ('Nov 2, 2021',113,38),
  ('Nov 2, 2021',114,37),
  ('Nov 2, 2021',115,43),
  ('Nov 2, 2021',116,42),
  ('Nov 2, 2021',117,37),
  ('Nov 2, 2021',118,37),
  ('Nov 2, 2021',119,36),
  ('Nov 2, 2021',120,36);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',121,41),
  ('Nov 2, 2021',122,42),
  ('Nov 2, 2021',123,41),
  ('Nov 2, 2021',124,35),
  ('Nov 2, 2021',125,36),
  ('Nov 2, 2021',126,42),
  ('Nov 2, 2021',127,41),
  ('Nov 2, 2021',128,42),
  ('Nov 2, 2021',129,35),
  ('Nov 2, 2021',130,39);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',131,36),
  ('Nov 2, 2021',132,36),
  ('Nov 2, 2021',133,37),
  ('Nov 2, 2021',134,38),
  ('Nov 2, 2021',135,39),
  ('Nov 2, 2021',136,40),
  ('Nov 2, 2021',137,36),
  ('Nov 2, 2021',138,35),
  ('Nov 2, 2021',139,36),
  ('Nov 2, 2021',140,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',141,35),
  ('Nov 2, 2021',142,41),
  ('Nov 2, 2021',143,36),
  ('Nov 2, 2021',144,35),
  ('Nov 2, 2021',145,42),
  ('Nov 2, 2021',146,35),
  ('Nov 2, 2021',147,37),
  ('Nov 2, 2021',148,36),
  ('Nov 2, 2021',149,39),
  ('Nov 2, 2021',150,38);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',151,38),
  ('Nov 2, 2021',152,34),
  ('Nov 2, 2021',153,37),
  ('Nov 2, 2021',154,37),
  ('Nov 2, 2021',155,35),
  ('Nov 2, 2021',156,43),
  ('Nov 2, 2021',157,41),
  ('Nov 2, 2021',158,41),
  ('Nov 2, 2021',159,39),
  ('Nov 2, 2021',160,42);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',161,39),
  ('Nov 2, 2021',162,39),
  ('Nov 2, 2021',163,34),
  ('Nov 2, 2021',164,37),
  ('Nov 2, 2021',165,42),
  ('Nov 2, 2021',166,42),
  ('Nov 2, 2021',167,38),
  ('Nov 2, 2021',168,36),
  ('Nov 2, 2021',169,37),
  ('Nov 2, 2021',170,35);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',171,39),
  ('Nov 2, 2021',172,43),
  ('Nov 2, 2021',173,40),
  ('Nov 2, 2021',174,34),
  ('Nov 2, 2021',175,42),
  ('Nov 2, 2021',176,35),
  ('Nov 2, 2021',177,40),
  ('Nov 2, 2021',178,42),
  ('Nov 2, 2021',179,42),
  ('Nov 2, 2021',180,41);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',181,34),
  ('Nov 2, 2021',182,40),
  ('Nov 2, 2021',183,37),
  ('Nov 2, 2021',184,38),
  ('Nov 2, 2021',185,37),
  ('Nov 2, 2021',186,42),
  ('Nov 2, 2021',187,42),
  ('Nov 2, 2021',188,43),
  ('Nov 2, 2021',189,40),
  ('Nov 2, 2021',190,41);
INSERT INTO myTable (hdate,eid,temperature)
VALUES
  ('Nov 2, 2021',191,37),
  ('Nov 2, 2021',192,35),
  ('Nov 2, 2021',193,38),
  ('Nov 2, 2021',194,34),
  ('Nov 2, 2021',195,40),
  ('Nov 2, 2021',196,36),
  ('Nov 2, 2021',197,34),
  ('Nov 2, 2021',198,41),
  ('Nov 2, 2021',199,42),
  ('Nov 2, 2021',200,34);
