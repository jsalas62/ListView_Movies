import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontFamily: 'Georgia', fontSize: 24),
          bodyMedium: TextStyle(fontFamily: 'Arial', fontSize: 18, color: Colors.grey[600]),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cartelera de Cine'),
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Rambo',
      genre: 'Acción',
      imageUrl: 'https://es.web.img3.acsta.net/pictures/19/09/03/17/01/2834543.jpg',
    ),
    Movie(
      title: 'The Godfather',
      genre: 'Drama',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BYTJkNGQyZDgtZDQ0NC00MDM0LWEzZWQtYzUzZDEwMDljZWNjXkEyXkFqcGc@._V1_.jpg',
    ),
    Movie(
      title: 'Back to the Future',
      genre: 'Ciencia Ficción',
      imageUrl: 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2928861/5939354/MOVCJ8356__33728.1679585644.jpg?c=2',
    ),
    Movie(
      title: 'Rocky',
      genre: 'Deportes',
      imageUrl: 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/500x659/products/2865554/5894573/MOVII4109__01078.1679553406.jpg?c=2',
    ),
    Movie(
      title: 'Taxi Driver',
      genre: 'Drama',
      imageUrl: 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/293224/4517168/MOV414302__10127.1541945836.jpg?c=2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genre,
    required this.imageUrl,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: AspectRatio(
              aspectRatio: 4 / 5, // Mantiene la relación de aspecto 4:5
              child: Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  movie.genre,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700], size: 24),
                    Icon(Icons.star, color: Colors.yellow[700], size: 24),
                    Icon(Icons.star, color: Colors.yellow[700], size: 24),
                    Icon(Icons.star, color: Colors.yellow[700], size: 24),
                    Icon(Icons.star_half, color: Colors.yellow[700], size: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
