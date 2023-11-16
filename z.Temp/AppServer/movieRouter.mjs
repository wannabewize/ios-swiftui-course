import express from "express";
import { sendMovies, sendMovieById } from "./movieController.mjs";

const router = express.Router();

router.get('/movies', sendMovies);
router.get('/movies/:id', sendMovieById);

export default router;

