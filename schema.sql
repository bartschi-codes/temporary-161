-- users – one row per account/profile
CREATE TABLE users (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,   -- unique numeric id
    username     TEXT    NOT NULL UNIQUE,             -- login name
	phone_nummber	TEXT,
    password     TEXT    NOT NULL,                    -- hashed password
    role         TEXT    NOT NULL DEFAULT 'user',     -- 'user' | 'admin' etc.
    bio          TEXT,                                -- profile text
    avatar_url   TEXT,                                -- profile image
    created_at   TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- friend relationships / requests; two rows per friendship or one row per
-- request depending on your UX.  status can be 'pending','accepted','blocked'…
CREATE TABLE friends (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id     INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    friend_id   INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    status      TEXT    NOT NULL DEFAULT 'pending',   -- accepted, pending, blocked
    created_at  TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, friend_id)                        -- prevent duplicates
);

-- posts authored by users
CREATE TABLE posts (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id   INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    text        TEXT,
    image_url   TEXT,                                 -- can store many with a join table
    created_at  TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TEXT    NOT NULL DEFAULT CURRENT_TIMESTAMP
);



-- indices to speed up common queries
CREATE INDEX idx_posts_author ON posts(author_id);
CREATE INDEX idx_friends_user ON friends(user_id);
