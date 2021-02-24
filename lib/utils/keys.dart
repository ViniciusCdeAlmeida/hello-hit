class Keys {
  static ProfileTalentEditKey profileTalentEdit = const ProfileTalentEditKey();
  static ProfileTeamEditKey profileTeamEdit = const ProfileTeamEditKey();
  static ProfileTalentKey profileTalent = const ProfileTalentKey();
  static ProfileTeamKey profileTeam = const ProfileTeamKey();
  static SearchKey searchScreen = const SearchKey();
  static LoginKey loginScreen = const LoginKey();
  static FeedKey feedScreen = const FeedKey();
  static RegisterKey registerScreen = const RegisterKey();
  static DrawerKey drawer = const DrawerKey();
  static PostCardKey postCard = const PostCardKey();
  static ErroMenssagesKey erroMenssages = const ErroMenssagesKey();
  static const String introScreen = 'introScreen';
  static const String backPageChatScreen = 'backPageChatScreen';
}

class PostCardKey {
  const PostCardKey();
  String get profilePostCard => 'profilePostCard';
  String get hitPostCard => 'hitPostCard';
  String get commentsPostCard => 'commentsPostCard';
  String get editPostCard => 'editPostCard';
  String get removePostCard => 'removePostCard';
}

class ErroMenssagesKey {
  const ErroMenssagesKey();
  String get erroUserLogin => 'erroUserLogin';
  String get erroPasswordLogin => 'hitPostCard';
  String get commentsPostCard => 'commentsPostCard';
  String get editPostCard => 'editPostCard';
  String get removePostCard => 'removePostCard';
}

class LoginKey {
  const LoginKey();
  String get emailFormScreen => 'emailFormScreen';
  String get passwordFormScreen => 'passwordLoginScreen';
  String get loginButtonLoginScreen => 'loginButtonScreen';
  String get registerLoginButtonLoginScreen => 'registerLoginButtonScreen';
  String get forgotPasswordButtonLoginScreen => 'forgotPasswordButtonScreen';
  String get resendEmailButtonLoginScreen => 'resendEmailButtonScreen';
}

class FeedKey {
  const FeedKey();
  String get drawerFeedScreen => 'drawerFeedScreen';
  String get actionsFeedScreen => 'actionsFeedScreen';
  String get editPostFeedScreen => 'editPostFeedScreen';
  String get deletePostFeedScreen => 'deletePostFeedScreen';
  String get deleteCancelPostFeedScreen => 'deleteCancelPostFeedScreen';
  String get deleteOkPostFeedScreen => 'deleteOkPostFeedScreen';
  String get searchFeedScreen => 'searchFeedScreen';
  String get homeFeedScreen => 'homeFeedScreen';
  String get teamFeedScreen => 'teamFeedScreen';
  String get makePostFeedScreen => 'makePostFeedScreen';
  String get opportFeedScreen => 'opportFeedScreen';
  String get profileFeedScreen => 'profileFeedScreen';
  String get makeHitFeedScreen => 'makeHitFeedScreen';
  String get commentFeedScreen => 'commentFeedScreen';
  String get commentIconFeedScreen => 'commentIconFeedScreen';
}

class RegisterKey {
  const RegisterKey();
  String get columnFormRegister => 'columnFormRegister';
  String get fullnameFormRegister => 'fullnameFormRegister';
  String get usernameFormRegister => 'usernameFormRegister';
  String get emailFormRegister => 'emailFormRegister';
  String get genderFormRegister => 'genderFormRegister';
  String get usertypeFormRegister => 'usertypeFormRegister';
  String get passwordFormRegister => 'passwordFormRegister';
  String get passwordconfirmFormRegister => 'passwordconfirmFormRegister';
  String get finalizeFormRegister => 'finalizeButtonFormRegister';
}

class DrawerKey {
  const DrawerKey();
  String get closeDrawer => 'closeDrawer';
  String get openDrawer => 'openDrawer';
  String get bookmarksDrawer => 'bookmarksDrawer';
  String get turnProDrawer => 'turnProDrawer';
  String get myTeamsDrawer => 'myTeamsDrawer';
  String get notificationDrawer => 'notificationDrawer';
  String get opportunitiesDrawer => 'opportunitiesDrawer';
  String get battleDrawer => 'battleDrawer';
  String get editProfileDrawer => 'editProfileDrawer';
  String get statisticsDrawer => 'statisticsDrawer';
  String get talentsShowDrawer => 'talentsShowDrawer';
  String get helloHitPayDrawer => 'helloHitPayDrawer';
  String get logoutDrawer => 'logoutDrawer';
  String get helpExpandDrawer => 'helpExpandDrawer';
  String get helpCenterHelpDrawer => 'helpCenterHelpDrawer';
  String get helpSupportInbDrawer => 'helpSupportInbDrawer';
  String get helpReportProbDrawer => 'helpReportProbDrawer';
  String get helpTermsDrawer => 'helpTermsDrawer';
  String get settingsExpandDrawer => 'settingsExpandDrawer';
  String get settingsDrawer => 'settingsDrawer';
  String get settingsPrivateDrawer => 'settingsPrivateDrawer';
  String get settingsLanguageDrawer => 'settingsLanguageDrawer';
}

class SearchKey {
  const SearchKey();
  String get skillSearchScreen => 'skillSearchScreen';
  String get placeSearchScreen => 'placeSearchScreen';
  String get searchButtonSearchScreen => 'searchButtonSearchScreen';
  String get advancedButtonSearchScreen => 'advancedButtonSearchScreen';
  String get radioButtonSearchScreen => 'radioButtonSearchScreen';
}

class ProfileTalentEditKey {
  const ProfileTalentEditKey();
  String get backButtonEditProfileTalentScreen => 'backButtonEditProfileTalentScreen';
  String get locationEditProfileTalentScreen => 'locationEditProfileTalentScreen';
  String get bioEditProfileTalentScreen => 'bioEditProfileTalentScreen';
  String get siteEditProfileTalentScreen => 'siteEditProfileTalentScreen';
  String get jobRoleEditProfileTalentScreen => 'jobRoleEditProfileTalentScreen';
  String get jobCompEditProfileTalentScreen => 'jobCompEditProfileTalentScreen';
  String get jobMonthTEditProfileTalentScreen => 'jobMonthTEditProfileTalentScreen';
  String get jobYearTEditProfileTalentScreen => 'jobYearTEditProfileTalentScreen';
  String get jobAddButtonEditProfileTalentScreen => 'jobAddButtonEditProfileTalentScreen';
  String get jobRemoveButtonEditProfileTalentScreen => 'jobRemoveButtonEditProfileTalentScreen';
  String get eduDegreeEditProfileTalentScreen => 'eduDegreeEditProfileTalentScreen';
  String get eduSchoolEditProfileTalentScreen => 'eduSchoolEditProfileTalentScreen';
  String get eduYearEditProfileTalentScreen => 'eduYearEditProfileTalentScreen';
  String get eduAddButtonEditProfileTalentScreen => 'eduAddButtonEditProfileTalentScreen';
  String get eduRemoveButtonEditProfileTalentScreen => 'eduRemoveButtonEditProfileTalentScreen';
  String get workFulltimeEditProfileTalentScreen => 'workFulltimeEditProfileTalentScreen';
  String get workFreelanceEditProfileTalentScreen => 'workFreelanceEditProfileTalentScreen';
  String get saveEditProfileTalentScreen => 'saveEditProfileTalentScreen';
}

class ProfileTeamEditKey {
  const ProfileTeamEditKey();
  String get locationEditProfileTeamScreen => 'locationEditProfileTeamScreen';
  String get nameEditProfileTeamScreen => 'nameEditProfileTeamScreen';
  String get bioEditProfileTeamScreen => 'bioEditProfileTeamScreen';
  String get siteEditProfileTeamScreen => 'siteEditProfileTeamScreen';
  String get jobRoleEditProfileTeamScreen => 'jobRoleEditProfileTeamScreen';
  String get jobCompEditProfileTeamScreen => 'jobCompEditProfileTeamScreen';
  String get jobMonthTEditProfileTeamScreen => 'jobMonthTEditProfileTeamScreen';
  String get jobYearTEditProfileTeamScreen => 'jobYearTEditProfileTeamScreen';
  String get jobMonthFEditProfileTeamScreen => 'jobMonthFEditProfileTeamScreen';
  String get jobYearFEditProfileTeamScreen => 'jobYearFEditProfileTeamScreen';
  String get jobAddButtonEditProfileTeamScreen => 'jobAddButtonEditProfileTeamScreen';
  String get jobRemoveButtonEditProfileTeamScreen => 'jobRemoveButtonEditProfileTeamScreen';
  String get awardNameEditProfileTeamScreen => 'awardNameEditProfileTeamScreen';
  String get awardDescEditProfileTeamScreen => 'awardDescEditProfileTeamScreen';
  String get awardMonthEditProfileTeamScreen => 'awardMonthEditProfileTeamScreen';
  String get awardYearEditProfileTeamScreen => 'awardYearEditProfileTeamScreen';
  String get awardAddButtonEditProfileTeamScreen => 'awardAddButtonEditProfileTeamScreen';
  String get awardRemoveButtonEditProfileTeamScreen => 'awardRemoveButtonEditProfileTeamScreen';
  String get workFulltimeEditProfileTeamScreen => 'workFulltimeEditProfileTeamScreen';
  String get workFreelanceEditProfileTeamScreen => 'workFreelanceEditProfileTeamScreen';
  String get workSponsEditProfileTeamScreen => 'workSponsEditProfileTeamScreen';
  String get saveEditProfileTeamScreen => 'saveEditProfileTeamScreen';
}

class ProfileTalentKey {
  const ProfileTalentKey();
  String get makeHitProfileTalentScreen => 'makeHitProfileTalentScreen';
  String get inboxProfileTalentScreen => 'inboxProfileTalentScreen';
  String get beFanProfileTalentScreen => 'beFanProfileTalentScreen';
  String get editBtnProfileTalentScreen => 'editBtnProfileTalentScreen';
  String get myPostsTabProfileTalentScreen => 'myPostsTabProfileTalentScreen';
  String get myFansTabProfileTalentScreen => 'myFansTabProfileTalentScreen';
  String get myPostsProfileTalentScreen => 'myPostsProfileTalentScreen';
  String get myFansProfileTalentScreen => 'myFansProfileTalentScreen';
}

class ProfileTeamKey {
  const ProfileTeamKey();
  String get makeHitProfileTeamScreen => 'makeHitProfileTeamScreen';
  String get inboxProfileTeamScreen => 'inboxProfileTeamScreen';
  String get beFanProfileTeamScreen => 'beFanProfileTeamScreen';
  String get editBtnProfileTeamScreen => 'editBtnProfileTeamScreen';
  String get myPostsTabProfileTeamScreen => 'myPostTabProfileTeamScreen';
  String get myFansTabProfileTeamScreen => 'myFansTabProfileTeamScreen';
  String get myPostsProfileTeamScreen => 'myPostsProfileTeamScreen';
  String get myFansProfileTeamScreen => 'myFansProfileTeamScreen';
}
