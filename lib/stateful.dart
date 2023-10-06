import 'package:flutter/material.dart';

bool _isFavorite = false;
bool _showDescription = false;

class Artwork extends StatefulWidget {
  const Artwork({super.key});
  @override
  ArtworkState createState() => ArtworkState();
}

class ArtworkState extends State<Artwork> {
  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Œuvre ajoutée à vos favoris'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'images/Mona_Lisa.jpg',
              ),
              Icon(
                Icons.favorite,
                size: 100,
                color: _showDescription
                    ? Colors.transparent
                    : (_isFavorite
                        ? Colors.red
                        : Colors.white.withOpacity(0.50)),
              ),
              _showDescription
                  ? const SizedBox(
                      width: 300,
                      height: 300,
                      child: SingleChildScrollView(
                        child: Text(
                          'La Joconde, ou Portrait de Mona Lisa, est un tableau de l\'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu\'à 1517 (l\'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l\'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l\'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d\'artistes l\'ont pris comme référence. À l\'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l\'entoure, en faisant de ce tableau l’une des œuvres d\'art les plus célèbres du monde, si ce n\'est la plus célèbre : elle est en tout cas considérée comme l\'une des représentations d\'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l\'objet d\'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l\'admirer et la photographier quotidiennement.',
                          style: TextStyle(
                            fontFamily: 'Merriweather',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
          const Text(
            'Mona Lisa',
            style: TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 30,
              color: Colors.brown,
            ),
          ),
          const Text(
            'Léonard De Vinci',
            style: TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _isFavorite ? Colors.red : Colors.brown,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    if (_isFavorite) {
                      _showSnackBar();
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.article,
                  color: Colors.brown,
                ),
                onPressed: () {
                  setState(() {
                    _showDescription = !_showDescription;
                  });
                },
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
