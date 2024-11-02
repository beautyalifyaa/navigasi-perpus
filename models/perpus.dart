class Perpus {
  int id;
  String deskripsi;
  String judul;
  String stock;
  String penerbit;
  String karya;
  double? voteAverage;
  String posterPath;

  Perpus({
    required this.id,
    required this.deskripsi,
    required this.judul,
    required this.stock,
    required this.penerbit,
    required this.karya,
    this.voteAverage,
    required this.posterPath,
  });
}
