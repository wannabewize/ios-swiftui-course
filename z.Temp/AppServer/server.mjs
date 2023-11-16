import express from 'express';
import movieRouter from './movieRouter.mjs';

const app = express();
app.use(express.json());

app.use('/api', movieRouter);

const port = 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});