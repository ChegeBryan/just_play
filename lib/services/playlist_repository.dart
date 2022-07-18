abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 3}) async {
    return await _songs();
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }

  var _songIndex = 0;
  static const _maxSongNumber = 4;

  Future<List<Map<String, String>>> _songs() {
    return Future<List<Map<String, String>>>.value([
      {
        'id': '1',
        'title': 'Song 1',
        'album': 'SoundHelix',
        'url': 'https://www.mboxdrive.com/enak.mp3',
      },
      {
        'id': '2',
        'title': 'Song 2',
        'album': 'SoundHelix',
        'url': 'https://www.mboxdrive.com/_-_KRK_FTNA__(getmp3.pro).mp3',
      },
      {
        'id': '3',
        'title': 'Song 3',
        'album': 'SoundHelix',
        'url': 'https://www.mboxdrive.com/__(getmp3.pro).mp3',
      }
    ]);
  }

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': 'Song $_songIndex',
      'album': 'SoundHelix',
      'url': 'https://www.mboxdrive.com/enak.mp3',
    };
  }
}
