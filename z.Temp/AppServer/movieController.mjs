import { getMovieById, getMovies } from "./movie.model.mjs";

export const sendMovies = async (req, res) => {
    const movies = await getMovies()
    res.send({msg: 'ok', data: movies});
}

export const sendMovieById = async (req, res) => {
    const movieId = req.params.id;
    const movie = await getMovieById(movieId)
    res.send({msg: 'ok', data: movie});
}