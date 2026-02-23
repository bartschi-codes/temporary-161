-- three users; the `id` column is AUTOINCREMENT so the first row will be
-- 1, the second 2, etc.  password values are placeholders – in a real app
-- you would store a hash.
INSERT INTO users (username, phone_nummber, password, role, bio, avatar_url)
VALUES
  ('alice',   '123‑456‑7890', 'hashed_pw1', 'user', 'Hi, I’m Alice!', 'https://example.com/alice.png'),
  ('bob',     '234‑567‑8901', 'hashed_pw2', 'user', 'Bob here.',       'https://example.com/bob.png'),
  ('charlie', '345‑678‑9012', 'hashed_pw3', 'user', 'Charlie chats.', 'https://example.com/charlie.png');

-- friendships / requests: we store two rows for an accepted friendship
-- (one in each direction); a pending request is only one row.
INSERT INTO friends (user_id, friend_id, status) VALUES
  (1, 2, 'accepted'),   -- Alice ↔ Bob
  (2, 1, 'accepted'),
  (2, 3, 'pending'),    -- Bob → Charlie (request not yet accepted)
  (3, 1, 'accepted');   -- Charlie ↔ Alice (already friends)

-- some posts by the users
INSERT INTO posts (author_id, text, image_url) VALUES
  (1, 'Hello world!',                       NULL),
  (1, 'Enjoying the sunny day',             'https://example.com/sunny.png'),
  (2, 'Glad to be here on this network.',   NULL),
  (3, 'Screenshot of my work',              'https://example.com/screenshot.png');

-- optional: you can add more rows for each table as required.