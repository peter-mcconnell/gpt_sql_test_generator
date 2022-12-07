-- Create a table for storing users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Create a table for storing posts
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Create a table for storing comments
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  post_id INTEGER NOT NULL REFERENCES posts(id),
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Create a table for storing tags
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert some users into the users table
INSERT INTO users (username, password, email) VALUES
  ('user1', 'password1', 'user1@example.com'),
  ('user2', 'password2', 'user2@example.com'),
  ('user3', 'password3', 'user3@example.com'),
  ('user4', 'password4', 'user4@example.com'),
  ('user5', 'password5', 'user5@example.com');

-- Insert some posts into the posts table
INSERT INTO posts (user_id, title, body) VALUES
  (1, 'Post 1', 'This is the body of post 1'),
  (1, 'Post 2', 'This is the body of post 2'),
  (2, 'Post 3', 'This is the body of post 3'),
  (2, 'Post 4', 'This is the body of post 4'),
  (3, 'Post 5', 'This is the body of post 5'),
  (3, 'Post 6', 'This is the body of post 6'),
  (4, 'Post 7', 'This is the body of post 7'),
  (4, 'Post 8', 'This is the body of post 8'),
  (5, 'Post 9', 'This is the body of post 9'),
  (5, 'Post 10', 'This is the body of post 10');

-- Insert some comments into the comments table
INSERT INTO comments (user_id, post_id, body) VALUES
  (1, 1, 'This is the first comment on post 1'),
  (1, 1, 'This is the second comment on post 1'),
  (1, 2, 'This is the first comment on post 2'),
  (2, 3, 'This is the first comment on post 3'),
  (2, 3, 'This is the second comment on post 3'),
  (2, 4, 'This is the first comment on post 4'),
  (3, 5, 'This is the first comment on post 5'),
  (3, 5, 'This is the second comment on post 5'),
  (3, 6, 'This is the first comment on post 6'),
  (4, 7, 'This is the first comment on post 7');

-- Insert some tags into the tags table
INSERT INTO tags (name) VALUES
  ('tag1'),
  ('tag2'),
  ('tag3'),
  ('tag4'),
  ('tag5');

-- Insert additional posts into the posts table
INSERT INTO posts (user_id, title, body) VALUES
  (1, 'Post 11 (French)', 'Ceci est le corps du post 11'),
  (1, 'Post 12 (Mandarin)', '这是第12篇文章的正文'),
  (1, 'Post 13 (Ukrainian)', 'Це тіло поста 13'),
  (2, 'Post 14 (French)', 'Ceci est le corps du post 14'),
  (2, 'Post 15 (Mandarin)', '这是第15篇文章的正文'),
  (2, 'Post 16 (Ukrainian)', 'Це тіло поста 16'),
  (3, 'Post 17 (French)', 'Ceci est le corps du post 17'),
  (3, 'Post 18 (Mandarin)', '这是第18篇文章的正文'),
  (3, 'Post 19 (Ukrainian)', 'Це тіло поста 19'),
  (4, 'Post 20 (French)', 'Ceci est le corps du post 20');
