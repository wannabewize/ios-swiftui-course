class MovieEntity {
    constructor({ title, genres, director, actors, plot, posterUrl }) {
        this.id = new UUID();
        this.title = title;
        this.director = director;
        this.synopsis = synopsis;
        this.poster = poster;
        this.actors = actors;
        this.release = release;
    }
}