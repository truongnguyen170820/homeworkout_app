
class ApiConstants {
  static const String BASE_URL="http://belife.vn:16000/api";
  // static const String BASE_URL="http://192.168.1.86:15000/api";
  // static const String BASE_URL="http://192.168.1.189:55327/api";
  //  static final String SHARE_POST_LINK = "http://192.168.1.86:20000/Member/Post/Index?postIdStr=";
  static final String SHARE_POST_LINK = "https://belife.vn/Member/Post/Index?postIdStr=";

  static const String SIGNIN_ACCOUNT = "/user/login";
  static final String LOGIN_SOCIAL = "/user/loginSocial?";
  static const String CHANGE_PWD_USER = "$BASE_URL/user/changepassword";
  static const String INTRODUCE_CODE = "$BASE_URL/user/introduceCode";
  static const String REQUIRE_OTP = "$BASE_URL/user/RequireOtp";
  static const String REQUIRE_OTP_NEW = "/user/RequireOtp";
  static const String VALIDATE_OTP = "$BASE_URL/user/validateOtp";
  static const String REGISTER = "$BASE_URL/user/register";
  static const String RESET_PWD = "$BASE_URL/user/resetPwd";
  static const String ADD_MY_HOBBY = "$BASE_URL/user/updateMyHobby";
  static const String UPLOAD_FILE = "$BASE_URL/file/uploadvideohls";
  static const String COUNT_NOTIFICATION_UNREAD = "/notify/CountUnread";
  static const String MY_ACCOUNT =  "/user/myAccount";
  static const String TRANSACTION = "/user/transaction";
  //
  static const String NEW_FEED = "/post/feed";
  static const String FEED_FOR_JOINED_MEMBER = "/post/feedByGroup";
  static const String PERSONAL_FEED = "/post/getAllMemberPost";
  static const String DELETE_VIDEO = "/api/video/delete";
  static const String GET_PROFILE = "/user/getprofile";
  static const String UPDATE_PROFILE = "/user/updateprofile";
  static const String POST_LIKE = "$BASE_URL/post/like";
  static const String POST_COMMENT = "/post/comment";
  static const String POST_SUB_LIKE = "$BASE_URL/post/likeComment";
  static const String POST_SUB_COMMENT = "$BASE_URL/post/subComment";
  static const String POST_LIKE_SUB_COMMENT = "/post/likeSubComment";
  static const String POST_UPDATE_SUB_COMMENT = "/post/updateSubComment";
  static const String POST_UPDATE_COMMENT = "/post/updateComment";
  static const String POST_DELETE_SUB_COMMENT = "/post/deleteSubComment";
  static const String POST_DELETE_COMMENT = "/post/deleteComment";
  static const String GET_SLIDER_LIST = "/Shop/GetSliderList?";
  static const String GET_PRODUCT_CAT = "/Shop/GetItemGroups?";
  static const String GET_PRODUCT_LIST = "/Shop/GetProductList?";
  static const String GET_PRODUCT_DETAIL = "/shop/GetProductDetail";
  static const String PROMOTION_CODE = "$BASE_URL/Shop/promotionCode";
  static const String GET_BRANDS = "/Shop/GetTrademarkList?";
  static const String GET_VIDEO_GROUP = "/video/getGroups";
  static const String GET_LIST_VIDEO_GROUP = "/video/getListVideos";
  static const String GET_MORE_VIDEO_DEPARTMENT = "/enterprise/getMoreVideos";
  static final String GET_ALL_TRAINER = "/trainer/getAll";
  static final String GET_ALL_GROUP = "/user/getAllGroupNeedFollow";
  static final String GET_ALL_ADVISORY = "/advisory/feed";
  static final String GET_MY_ADVISORY = "/advisory/myAdvisory";
  static final String GET_ALL_FOLLOWED_GROUP = "/user/getAllMyFollowedGroup";
  static final String JOIN_TO_GROUP = "/user/addMyFollowedGroup";
  static final String LEFT_TO_GROUP = "/user/removeMyFollowedGroup";
  static const String GET_CART = "/shop/GetCurrentCart?";
  static const String ADD_TO_CART = "/shop/AddToCart?";
  static const String DELETE_ITEM_CART = "/shop/DeleteItemCart?";
  static const String CHANGE_AMOUNT_ITEM_CART = "/shop/ChangeItemInCart?";
  static const String CHANGE_CART_TO_PAYMENT = "/shop/ChangeToPayment?";
  static const String FEE_SHIP = "/ghtk/feeship";
  static const String CART_UPDATE_CART_PAYMENT = "/shop/updateCartPayment?";
  static const String CART_GET_PAYMENT_URL = "/payment/ttDonHangUrl";
  static const String CART_VERIFY_PAYMENT = "/payment/kiemtraTtDonhang";
  static const String GET_PROVINCE = "/shop/GetProvices?";
  static const String GET_DISTRICT = "/shop/GetDistrictsByProvice?";
  static const String GET_COMMUNE = "/shop/GetCommunes";
  static const String GET_MY_WALL_MEMBER_INFO = "/post/MyWall?";
  static const String ADD_STORY = "/story/add?";
  static const String UPDATE_STORY = "/story/update?";
  static const String DELETE_STORY = "/story/delete?";
  static const String UPDATE_DEVICE_MEMBER = "/user/updateDeviceMember?";
  static final String CREATE_POST = "$BASE_URL/post/create";
  static final String GROUP_DETAIL = "$BASE_URL/post/groupDetail";
  static final String GET_POST = "/post/getPost";
  static final String UPDATE_POST = "/post/update";
  static final String CREATE_POST_2 = "/post/create";
  static final String DELETE_POST = "/post/delete";
  static final String API_GET_TRAINER_REVIEW_BY_GROUP = "/trainer/reviewStatistic";
  static final String API_GET_RATE_TRAINER_REVIEW = "/trainer/getReview";
  static final String API_GET_EXERCISE_HISTORY = "/myfit/myExcersiceHistory";
  static final String API_ADD_CUSTOMER = "/image/addCusImage";
  static final String API_EDIT_CUSTOMER = "/image/updateCusImage";
  static final String API_DELETE_CUSTOMER = "/image/deleteCusImage";
  static final String API_UPLOADBASE64 = "/file/uploadbase64";
  static final String API_UPLOAD_IMAGE = "/file/upload";
  static final String REGISTER_BECOME_PT = "/trainer/registerPT";
  static final String CHECK_PT = "/trainer/checkPTRegStatus";
  static final String LIST_REVIEW_PT = "/trainer/getPrivatePTCalendar";
  static final String UPDATE_AVATAR = "/user/updateAvatar";
  static final String UPDATE_COVER = "/user/updateBackGround";
  static final String LIST_REVIEW_CUSTOMER = "/trainer/getExerciseHisByPt";
  static final String PURCHASE_HISTORY = "/shop/getCartHis";
  static final String ADVISORY_REQUEST = "/advisory/request";
  static final String ADVISORY_LAST = "/advisory/last";
  static final String GET_STATUS_CART = "/ghtk/getstatuscart";

  static const String SEARCH_FRIEND = "/friend/search?";
  static const  String ADD_FRIEND = "/friend/request?";
  static const  String FRIEND_CANCEL_FRIEND_RQ = "/friend/cancel?";
  static const  String FRIEND_ADD_FOLLOW = "/friend/follow?";
  static const  String FRIEND_UN_FOLLOW = "/friend/unFollow?";
  static const  String FRIEND_UN_FRIEND = "/friend/unfriend?";
  static const  String FRIEND_FORBIDDEN = "/friend/forbidden?";
  static const  String FRIEND_ACCEPT = "/friend/accept?";
  static const  String FRIEND_REJECT = "/friend/reject?";
  static const  String BLOCK_USER = "/friend/forbidden";
  static const  String HIDE_POST = "/post/hide";
  static const  String REPORT_SPAM = "/post/reportSpam";



  static const  String BLOCK_MEMBER = "/enterprise/blockMember";
  static const  String UN_BLOCK_MEMBER = "/enterprise/resetMember";
  static const  String REMOVE_MEMBER = "/enterprise/removeMember";

  static const String GET_ALL_IMAGE = "/image/myImages?";
  static const String GET_ALL_CUS_IMAGE = "/image/myCusImages?";
  static const String DELETE_IMAGE = "/image/deleteImage?";


  static const String GET_ALL_VIDEOS = "/video/getMoreVideos";

  static final String GET_NOTIFY = "/notify/get?";
  static final String READ_NOTIFY = "/notify/read?";



  static const String GET_GROUP_INFO = "/post/groupDetail";

  static const String TOP_UP_ACCOUNT = "/payment/napTienUrl";
  static const String BUY_PRODUCT = "/payment/ttMuaDichVuUrl";
  static const String CHECK_STATUS_BUY_PRODUCT = "/payment/kiemtraTtDichVu";
  static const String CHECK_STATUS_PAYMENT = "/payment/kiemtraNapTien";

  //My fitness
  static const String CONNECT_FITNESS = "/myfit/connect?";
  static const String CONNECT_TRAINER = "/trainer/connect?";
  static final String CHECK_IN = "/myfit/checkin?";
  static final String CHANGE_DEPT_DEFAULT = "/myfit/changeDefaultDepartment?";
  static final String TRAINER_CHANGE_DEPT_DEFAULT = "/trainer/changeDefaultDepartment?";
  static final String MY_FITNESS = "/myfit/myfitness";
  static final String MY_FITNESS_CALENDAR = "/myfit/getMyCalendar";

  static final String CALENDAR_EMPLOYEE = "/enterprise/employeeCalendar";

  static final String PT_FITNESS = "/trainer/myTrainerWall";
  static final String PT_FITNESS_HISTORY_BY_MONTH = "/trainer/getExerciseHisInMonthByPt";
  static final String PT_FITNESS_HISTORY_BY_MONTH_TOTAL = "/trainer/summaryPtCusInMonth";
  static final String PT_CLASS_FITNESS = "/trainer/myAllMemberInPTGroup";
  static final String PT_DETAIL_CLASS_FITNESS = "/trainer/getSessionInPtGroup";
  static final String PT_MEMBER_FITNESS = "/trainer/myAllMemberInPrivatePt";
  static final String PT_ALL_MEMBER = "/trainer/getAllCustomerOfPt";

  static final String PT_START_SESSION = "/trainer/startSession";
  static final String PT_END_SESSION = "/trainer/endSession";

  static final String GET_DEPARTMENT_INFO = "/enterprise/myEnterprise";
  static final String GET_WORK_DAY_HISTORY_EMPLOYEE = "/enterprise/workDayHistory";
  static final String GET_MORE_PT = "/enterprise/getMoreOnlinePT";
  static final String GET_MORE_PRODUCT = "/enterprise/getMoreProducts";
  static final String GET_MORE_ADDRESS="/enterprise/getMoreBranch";
  static final String GET_MORE_PRIVATE_NEWS="/enterprise/getMorePrivateNews";
  static final String GET_MORE_PUBLISH_NEWS="/enterprise/getMorePublicNews";
  static final String GET_ACCOUNT_LIST="/user/GetAccountList";


  static final String REVIEW_TRAINER="/myfit/review";
  static final String EXCERCISE_CALENDAE_BY_DAY="/trainer/myTrainerDayCalender";
  static final String DETAIL_EXCERCISE_CALENDAE_BY_DAY="/trainer/myTrainerSessionDetailCalender";
  static final String UPDATE_REVIEW_TRAINER="/myfit/updateReview";
  static final String PT_REVIEW="/trainer/evaluate";



  static final String GET_MEMBER_IN_DEPARTMENT="/enterprise/appMember";

  static final String GET_CONNECT_DEPARTMENT="/enterprise/connect";

  static const String GET_DEPARTMENT_FEEDBACK = "/enterprise/getMoreReviews";
  static const String MEMBER_FEEDBACK = "/enterprise/memberReviewDept";
  static const String GET_MEMBER_FEEDBACK = "/enterprise/memberGetReviewDept";
  static const String RETURN_MEMBER_FEEDBACK = "/enterprise/enterpriseReplyReview";
  static const String GET_DETAIL_MEMBER_FEEDBACK = "/enterprise/getDetailReview";
  static const String UPDATE_MOBILE_NUMBER = "/user/updatemobile";


//workout
  static final String LIBRARY_WORKOUT="/workout/listCategoryNoParent";
  static final String LIBRARY_WORKOUT_BY_PARRENT="/workout/listCategoryByParrent";
  static final String LIBRARY_WORKOUT_PRACTIVE_BY_CATEGORY="/workout/listPractiveByCate";
  static final String LIBRARY_WORKOUT_PRACTIVE_VOICE="/workout/listPractiveVoice";
  static final String CREATE_HISTORY_WORKOUT="/workout/createCategoryHistory";
  static final String HISTORY_WORKOUT="/workout/filterCategoryHis";
  static final String GET_HEAHTHY_INFO="/workout/getHealthyInfo";
  static final String UPDATE_HEAHTHY_INFO="/workout/updateHealthyInfo";
  //reminder
  static final String GET_REMINDER_WORKOUT="/workout/GetRemainers";
  static final String UPDATE_REMINDER_WORKOUT="/workout/updateReminder";
  static final String REMOVE_REMINDER_WORKOUT="/workout/removeReminder";
  static final String ADD_REMINDER_WORKOUT="/workout/AddReminder";

  //health
  static final String ADD_INFO_HEALTH="/myfit/addBodyMeasure";
  static final String GET_INFO_HEALTH="/myfit/getBodyMeasures";
  static final String DELETE_INFO_HEALTH="/myfit/deleteBodyMeasure";
  static final String FILLTER_INFO_HEALTH="/myfit/getGeneralHealthInfo";




  static ApiConstants shared = ApiConstants();

  String getFullImage(String url,{String type = ""}) {
    if(url!=null&&url.startsWith("http")) return url;
    if(url==null||url.isEmpty) return "";
    var lastIndex = url.lastIndexOf(".");
    var realPath = url;
    if(lastIndex>-1) realPath = url.substring(0,lastIndex) + type + url.substring(lastIndex);
    // return "http://192.168.1.86:20000/" + realPath;
    return "https://belife.vn/" + realPath;
  }
  String getFullImageAddress(String url,{String type = ""}) {
    if(url!=null&&url.startsWith("http")) return url;
    if(url==null||url.isEmpty) return "";
    var lastIndex = url.lastIndexOf(".");
    var realPath = url;
    if(lastIndex>-1) realPath = url.substring(0,lastIndex) + type + url.substring(lastIndex);
    // return "http://192.168.1.86:20000/" + realPath;
    return "https://jdi.timesoft.vn/" + realPath;
  }
  String getFullImageTimesoft(String url) {
    // return "http://192.168.1.86:18000/" + url.toString();
    return "https://belife.vn" + url.toString();
  }


  String getVideoStream(String url) {
    // return "https://192.168.1.86:20001/" + url.toString();
    return "https://belife.vn" + url.toString();
  }


}
