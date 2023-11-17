import data from './data.json' assert { type: 'json' };
import {v1} from "uuid";

let movies = data.movies;

export const getMovies = async () => {
  return movies;
}

export const getMovieById = async (id) => {
  return movies.find(movie => movie.id === id);
}

export const addMovie = async (title, director, synopsis, actors, release) => {
  const movie = {
    id: v1(),
    title,
    director,
    synopsis: synopsis || null,
    actors: actors || null,
    release: release || null
  }

  movies.push(movie);
  return movie;
}