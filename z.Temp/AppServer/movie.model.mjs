import data from './data.json' assert { type: 'json' };

let movies = data.movies;

export const getMovies = async () => {
  return movies;
}

export const getMovieById = async (id) => {
  return movies.find(movie => movie.id === id);
}