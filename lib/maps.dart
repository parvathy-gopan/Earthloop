import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<LatLng> _points = [
    LatLng(10.0, 76.6), // Kothamangalam
    LatLng(10.1, 76.3), // Aluva
    LatLng(9.96, 76.29), // Kadavantra
    LatLng(10.1, 76.4), // Perumbavoor
  ];

  List<int> _shortestPath = [];
  List<LatLng> _shortestPath2 =[];
  @override
  void initState() {
    super.initState();
    _calculateShortestPath();
  }

  void _calculateShortestPath() {
    Graph g = Graph(_points.length);
    g.addEdge(0, 1, 22);
    g.addEdge(0, 2, 1);
    g.addEdge(0, 3, 1);
    g.addEdge(1, 2, 1);
    g.addEdge(1, 3, 1);
    g.addEdge(2, 3, 1);


    _shortestPath = g.shortestPath(0, 3);
    for(int i=0;i<_shortestPath.length;i++)
    {
      print(_shortestPath[i]);
    }
    //_convert_cord2();
  }

  void _convert_cord2() {
    for(int i=0;i<_shortestPath.length;i++)
    {
      _shortestPath2[i]=_points[_shortestPath[i]];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortest Path Example'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(10.0, 76.6), // San Francisco (Center)
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: _points,
                color: Colors.blue.withOpacity(0.7),
                strokeWidth: 4.0,
              ),
              if (_shortestPath.isNotEmpty)
                Polyline(
                  points: _shortestPath2,
                  color: Colors.red,
                  strokeWidth: 4.0,
                ),
            ],
          ),
          MarkerLayerOptions(
            markers: _points
                .asMap()
                .entries
                .map(
                  (entry) => Marker(
                width: 80.0,
                height: 80.0,
                point: entry.value,
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: _shortestPath.contains(entry.value) ? Colors.red : Colors.blue,
                    size: 40.0,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class Graph {
  final int V;
  final List<List<int>> adj;

  Graph(this.V) : adj = List.generate(V, (index) => []);

  void addEdge(int u, int v, int weight) {
    adj[u].add(v);
    adj[v].add(u); // If the graph is undirected
  }

  List<int> shortestPath(int src, int dest) {
    List<int> dist = List.filled(V, 10000000000000);
    List<int> parent = List.filled(V, -1);
    PriorityQueue<Node> pq = PriorityQueue<Node>((a, b) => a.dist.compareTo(b.dist));

    dist[src] = 0;
    pq.add(Node(src, 0));

    while (pq.isNotEmpty) {
      int u = pq.removeFirst().id;
      if (u == dest) break;

      for (int v in adj[u]) {
        int weight = 1; // Assuming each edge has a weight of 1
        if (dist[u] + weight < dist[v]) {
          dist[v] = dist[u] + weight;
          parent[v] = u;
          pq.add(Node(v, dist[v]));
        }
      }
    }

    List<int> path = [];
    int current = dest;
    while (current != -1) {
      path.add(current);
      current = parent[current];
    }
    path = path.reversed.toList();
    return path;
  }
}

class Node {
  final int id;
  final int dist;

  Node(this.id, this.dist);
}
