-- Создание таблицы жанров
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы исполнителей
CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы альбомов
CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT CHECK (release_year >= 1900)  -- Ограничение на год выпуска
);

-- Создание таблицы треков
CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT CHECK (duration > 0),  -- Ограничение на продолжительность трека
    album_id INT REFERENCES albums(album_id)
);

-- Создание таблицы сборников
CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT CHECK (release_year >= 1900)  -- Ограничение на год выпуска
);

-- Создание таблицы связи многие-ко-многим между жанрами и исполнителями
CREATE TABLE artist_genres (
    artist_id INT REFERENCES artists(artist_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы связи многие-ко-многим между исполнителями и альбомами
CREATE TABLE artist_albums (
    artist_id INT REFERENCES artists(artist_id),
    album_id INT REFERENCES albums(album_id),
    PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы связи многие-ко-многим между треками и сборниками
CREATE TABLE compilation_tracks (
    compilation_id INT REFERENCES compilations(compilation_id),
    track_id INT REFERENCES tracks(track_id),
    PRIMARY KEY (compilation_id, track_id)
);
