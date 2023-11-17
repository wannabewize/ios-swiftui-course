import express from "express";
import { handleMovieList, handleMovieDetail, handleMovieCreation } from "./movieController.mjs";
import { handleCommentCreation, handleCommentList } from './movieController.mjs';

const router = express.Router();

router.get('/movies', handleMovieList);
router.post('/movies', handleMovieCreation);
router.get('/movies/:id', handleMovieDetail);

router.get('/movies/:id/comments', handleCommentList);
router.post('/movies/:id/comments', handleCommentCreation);

export default router;

