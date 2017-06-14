CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users(fname,lname)
VALUES
  ('Devansh','Patel'),
  ('Alice','Chen');

INSERT INTO
  questions(title,body,author_id)
VALUES
  ('Rating','How good is App Academy?',1),
  ('Class Size','How many students are there in a cohort?',2);

INSERT INTO
  question_follows(user_id,question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Devansh'),(SELECT id FROM questions WHERE title = 'Rating')),
  ((SELECT id FROM users WHERE fname = 'Alice'),(SELECT id FROM questions WHERE title = 'Class Size'));

INSERT INTO
  replies(body,question_id,user_id,parent_id)
VALUES
  ('It''s great',(SELECT id FROM questions WHERE title = 'Rating'),(SELECT id FROM users WHERE fname = 'Devansh'),NULL),
  ('It''s not great',(SELECT id FROM questions WHERE title = 'Rating'),(SELECT id FROM users WHERE fname = 'Devansh'),1);

  INSERT INTO
    question_likes(user_id,question_id,likes)
  VALUES
    (1,2,2);
