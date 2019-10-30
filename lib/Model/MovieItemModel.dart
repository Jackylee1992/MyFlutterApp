class MovieItemModel {
  final Map rating;
  final List<String> genres;
  final String title;
  final List<Map> casts;
  final List<String> durations;
  final int collect_count;
  final String mainland_pubdate;
  final String original_title;
  final bool has_video;
  final String subtype;
  final String year;
  final String alt;
  final String id;
  
  MovieItemModel(
    this.title,
    this.alt, 
    this.rating, 
    this.genres, 
    this.casts, 
    this.durations, 
    this.collect_count, 
    this.mainland_pubdate, 
    this.original_title, 
    this.has_video, 
    this.subtype, 
    this.year, 
    this.id);
}