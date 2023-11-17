import { getMovieById, getMovies, addMovie } from "./movie.model.mjs";

export const handleMovieList = async (req, res) => {
    const movies = await getMovies()
    res.send({msg: 'ok', data: movies});
}

export const handleMovieDetail = async (req, res) => {
    const movieId = req.params.id;
    const movie = await getMovieById(movieId)
    res.send({msg: 'ok', data: movie});
}

export const handleMovieCreation = async (req, res) => {
    console.log('req.body :', req.body);

    const {title, director, synopsis, actors, release} = req.body;
    if ( !title || !director ) {
        res.status(400).send({msg: 'Bad Request'});
        return;
    }

    const ret = await addMovie(title, director, synopsis, actors, release);
    
    res.send({msg: 'ok', data: ret});
}

export const handleCommentCreation = async (req, res) => {
    res.send("WIP")
}

export const handleCommentList = async (req, res) => {
    res.send("WIP");
}