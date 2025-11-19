enum PostType {
  tag,
  album,
  media,
  checkin,
  live,
  poll,
}

enum PrivacyType {
  me,
  friends,
  public,
}

enum FileTypes {
  image,
  video,
  file,
}

FileTypes getFileType(String filePath) {
  String extension = filePath.split('.').last.toLowerCase();
  const List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'bmp',
    'heic',
    'webp'
  ];
  const List<String> videoExtensions = [
    'mp4',
    'mov',
    'avi',
    'mkv',
    'webm',
    '3gp'
  ];

  if (imageExtensions.contains(extension)) {
    return FileTypes.image;
  } else if (videoExtensions.contains(extension)) {
    return FileTypes.video;
  } else {
    return FileTypes.file;
  }
}

String kLoginInfo = "loginInfo";
String kData = "data";
String kUid = "chatUserId";
String kToken = "access_token";
String kAuth = "Authorization";
String kBrear = "Bearer";
String kConvName = "nickName";
String kPhoto = "photo";
String kNetworkStatus = "networkstatus";
String kExpireDate = "expireDate";
String kTyping = "isTyping";
String userId = "userId";
String kValue = "typing";
String kInfoValue(String key) => "info$key";
const String kBusinessChat = "We have received your order";
const String kItemConfirmation = 'Items Confirmation';
String participant = 'Add admin';
String kPath = 'assets/translations';
const String kLng = 'Language';
const String kMM = 'Myanmar';
const String kEN = 'English';
const String kThais = 'Thailand';
const String ken = 'en';
const String kmy = 'my';
const String kthai = 'th';
const String kGallery = 'gallery';
const String member = 'Member';
const String admin = 'Admin';
const String remember = 'rememberMe';
const String kGpChat = 'groupchat';
const String kbsChat = 'businesschat';
const String kStories = 'stories';
const String kVibtrate = 'vibrate';
const String kRingtone = 'ringtone';
const String kFontSize = 'fontsize';
const String notificationInvoking = "notification";
const String img = "image";
const String nick = "nickname";
const String brief = "briefData";
const String loginInfo = "loginInfo";
const String password = "password";
const String phone = "phone";
const String sigin = "Sign in";
const String userName = "username";
const String kLogin = "login";
//const String //kIncome = "income";
const String kForeground = "setAsForeground";
const String kBackground = "setAsBackground";
const String kExt = "ext";
const String kActive = "Active";
const String kUnread = "mark unread";
const String kMute = "mark mute";
const String kHide = "mark hide";
const String kBlock = "block";
const String kUnblock = "Unblock";
const String kOwner = "Owner";
const String kSortUnread = "SortUnread";

String keyToLng(String key) {
  switch (key) {
    case kmy:
      return kMM;
    case ken:
      return kEN;
    case kthai:
      return kThais;
    default:
      return kEN;
  }
}

String lngToKey(String lng) {
  switch (lng) {
    case kMM:
      return kmy;
    case kEN:
      return ken;
    case kThais:
      return kthai;
    default:
      return ken;
  }
}
