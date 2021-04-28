// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Apps`
  String get apps {
    return Intl.message(
      'Apps',
      name: 'apps',
      desc: '',
      args: [],
    );
  }

  /// `Bestseller`
  String get bestseller {
    return Intl.message(
      'Bestseller',
      name: 'bestseller',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get latest {
    return Intl.message(
      'Latest',
      name: 'latest',
      desc: '',
      args: [],
    );
  }

  /// `For you`
  String get for_you {
    return Intl.message(
      'For you',
      name: 'for_you',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get see_more {
    return Intl.message(
      'See more',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get change_theme {
    return Intl.message(
      'Change theme',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Rate the app`
  String get rateTheApp {
    return Intl.message(
      'Rate the app',
      name: 'rateTheApp',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get sub_total {
    return Intl.message(
      'Sub Total',
      name: 'sub_total',
      desc: '',
      args: [],
    );
  }

  /// `Shipping fee`
  String get shipping_fee {
    return Intl.message(
      'Shipping fee',
      name: 'shipping_fee',
      desc: '',
      args: [],
    );
  }

  /// `Set Payment`
  String get set_payment {
    return Intl.message(
      'Set Payment',
      name: 'set_payment',
      desc: '',
      args: [],
    );
  }

  /// `Shipping to`
  String get shipping_to {
    return Intl.message(
      'Shipping to',
      name: 'shipping_to',
      desc: '',
      args: [],
    );
  }

  /// `Check out`
  String get checkout {
    return Intl.message(
      'Check out',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get upgrade {
    return Intl.message(
      'Upgrade',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `Gold Member`
  String get golden_mem {
    return Intl.message(
      'Gold Member',
      name: 'golden_mem',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Payment methods`
  String get payment_methods {
    return Intl.message(
      'Payment methods',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  /// `No payment method yet`
  String get none_payment_method {
    return Intl.message(
      'No payment method yet',
      name: 'none_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help_support {
    return Intl.message(
      'Help & Support',
      name: 'help_support',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant location`
  String get restaurant_location {
    return Intl.message(
      'Restaurant location',
      name: 'restaurant_location',
      desc: '',
      args: [],
    );
  }

  /// `Delivery time`
  String get delivery_time {
    return Intl.message(
      'Delivery time',
      name: 'delivery_time',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get just_now {
    return Intl.message(
      'Just now',
      name: 'just_now',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `Most searched`
  String get most_searched {
    return Intl.message(
      'Most searched',
      name: 'most_searched',
      desc: '',
      args: [],
    );
  }

  /// `You searched`
  String get you_searched {
    return Intl.message(
      'You searched',
      name: 'you_searched',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get my_orders {
    return Intl.message(
      'My orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Go to cart`
  String get go_to_cart {
    return Intl.message(
      'Go to cart',
      name: 'go_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared {
    return Intl.message(
      'Shared',
      name: 'shared',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get invite_friends {
    return Intl.message(
      'Invite Friends',
      name: 'invite_friends',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Leaderboard`
  String get leader_board {
    return Intl.message(
      'Leaderboard',
      name: 'leader_board',
      desc: '',
      args: [],
    );
  }

  /// `Play Quiz`
  String get play_quiz {
    return Intl.message(
      'Levels',
      name: 'Levels',
      desc: '',
      args: [],
    );
  }

  /// `Battle Quiz`
  String get battle_quiz {
    return Intl.message(
      'Battle',
      name: 'Battle',
      desc: '',
      args: [],
    );
  }

  /// `Daily Quiz`
  String get daily_quiz {
    return Intl.message(
      'Daily Bonus Points',
      name: 'Bonus Points',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions {
    return Intl.message(
      'Questions',
      name: 'questions',
      desc: '',
      args: [],
    );
  }

  /// `Question`
  String get question {
    return Intl.message(
      'Question',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Trivia result`
  String get trivia_result {
    return Intl.message(
      'Result',
      name: 'trivia_result',
      desc: '',
      args: [],
    );
  }

  /// `Your Points`
  String get your_points {
    return Intl.message(
      'Your Points',
      name: 'your_points',
      desc: '',
      args: [],
    );
  }

  /// `required points`
  String get required_points {
    return Intl.message(
      'Minimum required points',
      name: 'required_ponts',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `A player has been found`
  String get found_player {
    return Intl.message(
      'A player has been found',
      name: 'found_player',
      desc: '',
      args: [],
    );
  }

  /// `Deny`
  String get deny {
    return Intl.message(
      'Deny',
      name: 'deny',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get sport {
    return Intl.message(
      'Sport',
      name: 'sport',
      desc: '',
      args: [],
    );
  }

  /// `Sports of the day`
  String get sports_of_the_day {
    return Intl.message(
      'Sports of the day',
      name: 'sports_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get nature {
    return Intl.message(
      'Nature',
      name: 'nature',
      desc: '',
      args: [],
    );
  }

  /// `Nature of the day`
  String get nature_of_the_day {
    return Intl.message(
      'Nature of the day',
      name: 'nature_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Music of the day`
  String get music_of_the_day {
    return Intl.message(
      'Music of the day',
      name: 'music_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Science of the day`
  String get science_of_the_day {
    return Intl.message(
      'Science of the day',
      name: 'science_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `screen is being updated`
  String get updating_screen {
    return Intl.message(
      'screen is being updated',
      name: 'updating_screen',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password ?`
  String get forgot_pass {
    return Intl.message(
      'Forgot password ?',
      name: 'forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get create_your_acc {
    return Intl.message(
      'Create your account',
      name: 'create_your_acc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_to_your_acc {
    return Intl.message(
      'Login to your account',
      name: 'login_to_your_acc',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_pass {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Looking for hotels, motel, homestay or department near you.`
  String get init_auth {
    return Intl.message(
      'Looking for hotels, motel, homestay or department near you.',
      name: 'init_auth',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get do_not_have_acc {
    return Intl.message(
      'Don\'t have an account?',
      name: 'do_not_have_acc',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account ? `
  String get have_acc_already {
    return Intl.message(
      'Do you already have an account ? ',
      name: 'have_acc_already',
      desc: '',
      args: [],
    );
  }

  /// `Hotel near me`
  String get hotel_near_me {
    return Intl.message(
      'Hotel near me',
      name: 'hotel_near_me',
      desc: '',
      args: [],
    );
  }

  /// `night`
  String get night {
    return Intl.message(
      'night',
      name: 'night',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get month {
    return Intl.message(
      'month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `adults`
  String get adults {
    return Intl.message(
      'adults',
      name: 'adults',
      desc: '',
      args: [],
    );
  }

  /// `adult`
  String get adult {
    return Intl.message(
      'adult',
      name: 'adult',
      desc: '',
      args: [],
    );
  }

  /// `No children`
  String get no_children {
    return Intl.message(
      'No children',
      name: 'no_children',
      desc: '',
      args: [],
    );
  }

  /// `children`
  String get children {
    return Intl.message(
      'children',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `child`
  String get child {
    return Intl.message(
      'child',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `room`
  String get room {
    return Intl.message(
      'room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `rooms`
  String get rooms {
    return Intl.message(
      'rooms',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `- night stay`
  String get night_stay {
    return Intl.message(
      '- night stay',
      name: 'night_stay',
      desc: '',
      args: [],
    );
  }

  /// `Price (for 1 night)`
  String get price_for_1night {
    return Intl.message(
      'Price (for 1 night)',
      name: 'price_for_1night',
      desc: '',
      args: [],
    );
  }

  /// `Popular filter`
  String get popular_filter {
    return Intl.message(
      'Popular filter',
      name: 'popular_filter',
      desc: '',
      args: [],
    );
  }

  /// `Distance from city center`
  String get distance {
    return Intl.message(
      'Distance from city center',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Check-in & check-out date`
  String get check_in_out {
    return Intl.message(
      'Check-in & check-out date',
      name: 'check_in_out',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Go to map`
  String get go_to_map {
    return Intl.message(
      'Go to map',
      name: 'go_to_map',
      desc: '',
      args: [],
    );
  }

  /// `Book now`
  String get book_now {
    return Intl.message(
      'Book now',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details`
  String get enter_your_details {
    return Intl.message(
      'Enter your details',
      name: 'enter_your_details',
      desc: '',
      args: [],
    );
  }

  /// `Use your profile`
  String get use_your_profile {
    return Intl.message(
      'Use your profile',
      name: 'use_your_profile',
      desc: '',
      args: [],
    );
  }

  /// `Another profile`
  String get another_profile {
    return Intl.message(
      'Another profile',
      name: 'another_profile',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Thank for booking !`
  String get thank_for_booking {
    return Intl.message(
      'Thank for booking !',
      name: 'thank_for_booking',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get back_to_home {
    return Intl.message(
      'Back to Home',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Missing call`
  String get call_missed {
    return Intl.message(
      'Missing call',
      name: 'call_missed',
      desc: '',
      args: [],
    );
  }

  /// `Call back`
  String get call_back {
    return Intl.message(
      'Call back',
      name: 'call_back',
      desc: '',
      args: [],
    );
  }

  /// `Add new chat`
  String get add_new_chat {
    return Intl.message(
      'Add new chat',
      name: 'add_new_chat',
      desc: '',
      args: [],
    );
  }

  /// `New group`
  String get new_group {
    return Intl.message(
      'New group',
      name: 'new_group',
      desc: '',
      args: [],
    );
  }

  /// `Find friends`
  String get find_friends {
    return Intl.message(
      'Find friends',
      name: 'find_friends',
      desc: '',
      args: [],
    );
  }

  /// `Similar characteristics`
  String get similar_characteristics {
    return Intl.message(
      'Similar characteristics',
      name: 'similar_characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get suggestions {
    return Intl.message(
      'Suggestions',
      name: 'suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get mute {
    return Intl.message(
      'Mute',
      name: 'mute',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Speaker`
  String get speaker {
    return Intl.message(
      'Speaker',
      name: 'speaker',
      desc: '',
      args: [],
    );
  }

  /// `Add user`
  String get add_user {
    return Intl.message(
      'Add user',
      name: 'add_user',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Personal page`
  String get personal_page {
    return Intl.message(
      'Personal page',
      name: 'personal_page',
      desc: '',
      args: [],
    );
  }

  /// `Change background`
  String get change_background {
    return Intl.message(
      'Change background',
      name: 'change_background',
      desc: '',
      args: [],
    );
  }

  /// `Turn off notification`
  String get turn_off_notification {
    return Intl.message(
      'Turn off notification',
      name: 'turn_off_notification',
      desc: '',
      args: [],
    );
  }

  /// `Create group with`
  String get create_group_with {
    return Intl.message(
      'Create group with',
      name: 'create_group_with',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get block {
    return Intl.message(
      'Block',
      name: 'block',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get me {
    return Intl.message(
      'Me',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Notifications & Sounds`
  String get notifications_sounds {
    return Intl.message(
      'Notifications & Sounds',
      name: 'notifications_sounds',
      desc: '',
      args: [],
    );
  }

  /// `Blocked accounts`
  String get blocked_acc {
    return Intl.message(
      'Blocked accounts',
      name: 'blocked_acc',
      desc: '',
      args: [],
    );
  }

  /// `Delete conversation`
  String get delete_conversation {
    return Intl.message(
      'Delete conversation',
      name: 'delete_conversation',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Actives`
  String get actives {
    return Intl.message(
      'Actives',
      name: 'actives',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get hotel {
    return Intl.message(
      'Hotel',
      name: 'hotel',
      desc: '',
      args: [],
    );
  }

  /// `Motel`
  String get motel {
    return Intl.message(
      'Motel',
      name: 'motel',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Near me`
  String get near_me {
    return Intl.message(
      'Near me',
      name: 'near_me',
      desc: '',
      args: [],
    );
  }

  /// `Low cost`
  String get low_cost {
    return Intl.message(
      'Low cost',
      name: 'low_cost',
      desc: '',
      args: [],
    );
  }

  /// `Top rate`
  String get top_rate {
    return Intl.message(
      'Top rate',
      name: 'top_rate',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your favourites`
  String get sub_tile_food {
    return Intl.message(
      'Please choose your favourites',
      name: 'sub_tile_food',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Drink`
  String get drink {
    return Intl.message(
      'Drink',
      name: 'drink',
      desc: '',
      args: [],
    );
  }

  /// `Cake`
  String get cake {
    return Intl.message(
      'Cake',
      name: 'cake',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
