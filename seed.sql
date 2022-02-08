DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS production;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS publication;
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE production (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    year INTEGER NOT NULL,
    company_id INTEGER REFERENCES companies(id)
);

CREATE TABLE publication (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    content VARCHAR(700) NOT NULL,
    preview TEXT,
    author_id INTEGER REFERENCES author(id),
    publication_id INTEGER REFERENCES publication(id),
    production_id INTEGER REFERENCES production(id)
);

INSERT INTO companies (name) VALUES ('Utah Festival Opera');
INSERT INTO companies (name) VALUES ('St. Petersburg Opera');
INSERT INTO companies (name) VALUES ('Opera Orlando');
INSERT INTO companies (name) VALUES ('Palm Beach Opera');
INSERT INTO companies (name) VALUES ('Maryland Opera Studio');

INSERT INTO production (name, year, company_id) VALUES ('Le nozze di Figaro', 2019, 1);
INSERT INTO production (name, year, company_id) VALUES ('Masterclass', 2019, 1);
INSERT INTO production (name, year, company_id) VALUES (`L'elisir d'amore`, 2017, 2);
INSERT INTO production (name, year, company_id) VALUES (`Don Pasquale`, 2016, 3);
INSERT INTO production (name, year, company_id) VALUES (`The Impresario`, 2016, 3);
INSERT INTO production (name, year, company_id) VALUES (`Opera on the Waterfront`, 2015, 4);
INSERT INTO production (name, year, company_id) VALUES (`The Daughter of the Regiment`, 2015, 4);
INSERT INTO production (name, year, company_id) VALUES (`Opera on the Waterfront`, 2014, 4);
INSERT INTO production (name, year, company_id) VALUES (`Alcina`, 2014, 4);
INSERT INTO production (name, year, company_id) VALUES (`The Abduction from the Seraglio`, 2011, 5);

INSERT INTO publication (name) VALUES ('Utah Theatre Bloggers');
INSERT INTO publication (name) VALUES ('Deseret News');
INSERT INTO publication (name) VALUES ('Utah Public Radio');
INSERT INTO publication (name) VALUES ('The Herald Journal');
INSERT INTO publication (name) VALUES ('Tampa Bay Times');
INSERT INTO publication (name) VALUES ('Orlando Sentinel');
INSERT INTO publication (name) VALUES ('Palm Beach Arts Paper');
INSERT INTO publication (name) VALUES ('The Shot Glass Review');
INSERT INTO publication (name) VALUES ('Edge Media Network');
INSERT INTO publication (name) VALUES ('The Washington Post');

INSERT INTO author (name) VALUES ('Elizabeth Hansen');
INSERT INTO author (name) VALUES ('Jay Wamsley');
INSERT INTO author (name) VALUES ('Charlie Schill');
INSERT INTO author (name) VALUES ('Andrew Meacham');
INSERT INTO author (name) VALUES ('Matthew J. Palm');
INSERT INTO author (name) VALUES ('Rex Hearn');
INSERT INTO author (name) VALUES ('Nate Sykes');
INSERT INTO author (name) VALUES ('Jack Gardner');
INSERT INTO author (name) VALUES ('Joan Reinthaler');

INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"I must kowtow to Bridgette Gan who plays the Countess Almaviva, the long suffering wife of the womanizing Count. Gan is exquisite as the Countess. Her first aria that opens Act II, “Porgi, amor, qualche ristoro,” (or, “Grant, love, some comfort“) is beautifully sung and staged by director Suzan Hanson. The Countess stands, her back to the audience, framed in an archway, her thoughts assuredly on her husband. Gan sings this heartfelt aria wrenchingly, with artistry and amazing control. Hanson and Gan trust the music to carry the moment, keeping the action simple. Gan's Act III aria, “Dove sono i bei momenti” is just as exquisite with Gan adding embellishments and nuances I've never heard before, which deepens its lush beauty."`, `"Gan is exquisite as the countess..."`, 1, 1, 1);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"As Act II opened, Countess Almaviva (Bridgette Gan) provided a production highlight with her lamentation over her husband's infidelity. It was heartfelt and pointed, and labeled Gan as the one to listen to."`, `It was heartfelt and pointed, and labeled Gan as the one to listen to..."`, 2, 2, 1);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Director Suzan Hanson gets marvelous performances from her entire cast, especially Rose-Antoinette Bellino and Bridgette Gan. Both women are impressive vocalists and their superb acting is just frosting on the cake.  As Rosina, the Countess Almaviva, Ms. Gan nicely balances what could have been contradictory roles as a tragically estranged spouse and a playfully amused object of a juvenile suitor's affections."`, `"Ms. Gan nicely balances what could have been contradictory roles as a tragically estranged spouse and a playfully amused object of a juvenile suitor's affections..."`, 3, 3, 1);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Bridgette Gan, as Sharon, the second Soprano is perfect in the role, and when she and Hanson interact, Hanson's innate vulnerability and love of opera works."`, `"Bridgette Gan, as Sharon, the second Soprano is perfect in the role..."`, 1, 1, 2);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Supporting cast members add lust and depth to the drama...Bridgette Gan beautifully performs an aria from 'Macbeth'"`, `"Bridgette Gan beautifully performs an aria from “Macbeth”..."`, 3, 4, 2);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"But the real draw is the promising Bridgette Gan as Adina, who made a strong impression in her St. Petersburg Opera debut. From her opening aria, Of the Cruel Isolda, Gan captures the ear and eye with power and precision. She also made use of other bel canto staples, such as the gradual crescendo and decrescendo, a portamento or glide between notes, and the artful gesture as part of a song's delivery. It was hard to watch her performance and imagine anyone else playing Adina."`, `"It was hard to watch her performance and imagine anyone else playing Adina..."`, 4, 5, 3);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Gan, who sports a clear, ringing soprano, has a saucy sparkle in her eyes--when Pasquale calls her a minx, you believe it."`, `"when Pasquale calls her a minx, you believe it..."`, 5, 6, 4);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"A tarted-up Bridgette Gan particularly sparkles, vocally and comically."`, `"Bridgette Gan particularly sparkles..."`, 5, 6, 5);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Next came the amazing Bridgette Gan, a fellow last year, now an opera star. Her soprano could break glass: the range is sensational and her pitch, perfection, as she sang Zerbinetta's Rondo from Strauss's Ariadne Auf Naxos. Impresarios will be happy to hire her. She'll fill seats with a command of vocal pyrotechnics like hers."`, `"She'll fill seats with a command of vocal pyrotechnics like hers..."`, 6, 7, 6);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Singing the role of Marie Saturday night was Palm Beach Opera Young Artist, Bridgette Gan (soprano). The role of Marie is a blend of coloratura and comic gags. Gan has lovely crystal clear high notes and a comic presence that brings to mind a slightly more refined Elly May Clampett."`, `"Gan has lovely crystal clear high notes and a comic presence..."`, 7, 8, 7);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"The cast for Saturday's performance featured a member of the Palm Beach Opera Young Artist program, Bridgette Gan, stepping into the role of Marie in place of another soprano who was ill.  Gan came in and gave a tour de force performance as Marie. Her voice has a rich tone with sparkling high notes. Her first aria, "Chacun le sait, Chacun le dit,"was beautifully sung and her second act show pieces, the melancholy "Par le rang et par l'opulence and the rousing "Salut a la France," were just as expertly and artfully sung. Gan delivered a vocally beautiful and consistent performance....Gan's performance as Marie was a great star turn for this young singer who has a world of potential in front of her."`, `"Gan's performance as Marie was a great star turn..."`, 8, 9, 7);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"'Glitter and Be Gay' from Leonard Bernstein's operetta "Candide" is one of the few pieces that crosses over between the operatic and musical theater repertories. It is a difficult piece to sing with a lot of florid coloratura and several high E flats. It also requires a lot of acting ability to pull off. Soprano Gan proved that she has the vocal as well as acting ability and stage presence to do this aria justice."`, `"Soprano Gan proved that she has the vocal as well as acting ability and stage presence to do this aria justice..."`, 8, 9, 8);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"Soprano Bridgette Gan wowed the audience with her fantastic and brilliant singing of “Glitter and Be Gay,” from Leonard Bernstein's Candide. She was sensational, and got the loudest applause."`, `"Soprano Bridgette Gan wowed the audience..."`, 6, 7, 8);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`Ever threatening, Gan's evil side was very convincing… her runs were perfection. After her touching scene with Bradamante posing as Ricciardo, Gan lets off a bunch of Handelian “fireworks” that could be heard in the Florida Keys. What a joy to hear her sing with such earnest conviction."`, `"her runs were perfection..."`, 6, 7, 9);
INSERT INTO reviews (content, preview, author_id, publication_id, production_id) VALUES (`"a gorgeous Konstanze…has the kind of lovely and flexible voice that can navigate intricate coloratura one minute and deliver a subtle put-down the next."`, `"a gorgeous Konstanze..."`, 9, 10, 10);