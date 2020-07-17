import 'package:flutter/material.dart';
import 'package:nafzly/models/job_post.dart';
import 'package:nafzly/models/user.dart';

const String homePage = "/";
const String loginPage = "loginPage";
const String signUpPage = "signUpPage";
const String jobsPage = "jobsPage";
const String chatPage = "chatPage";
const String savedJobsPage = "savedJobsPage";
const String profilePage = "profilePage";
const String profileEditingPage = "profileEditingPage";

ThemeData appTheme = ThemeData(
    primaryColor: Color(0xFFE8E80F),
    primaryColorDark: Color(0xFF4C4C4C),
    accentColor: Color(0xFFFFFFFF));

List<User> users = [
  User(
    userID: '1',
    userFirstName: 'Shouaib',
    userLastName: 'Mohammed',
    userAddress: 'Bani Suef, Egypt',
    userProfile: '',
  ),
  User(
    userID: '2',
    userFirstName: 'Abdelrahman',
    userLastName: 'Ragab',
    userAddress: 'Cairo, Egypt',
    userProfile: '',
  ),
  User(
    userID: '3',
    userFirstName: 'Abdallah',
    userLastName: 'Sobhy',
    userAddress: 'Alexandria, Egypt',
    userProfile: '',
  ),
];

List<JobPost> jobs = [
  JobPost(
    jobID: '1',
    jobOwnerID: '1',
    jobTitle: 'Android Developer to make some modifications',
    jobDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. lvoluptatem.',
    jobBudget: '\$150',
    jobLevel: 'Experienced',
    jobExecutionTime: 'Less than week',
    jobTime: '17:25 PM',
    isSaved: false,
  ),
  JobPost(
    jobID: '2',
    jobOwnerID: '2',
    jobTitle: 'Python Developer needed urgently !',
    jobDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. lvoluptatem.',
    jobBudget: '\$100',
    jobLevel: 'Intermediate',
    jobExecutionTime: 'Less than week',
    jobTime: '10:00 AM',
    isSaved: true,
  ),
  JobPost(
    jobID: '3',
    jobOwnerID: '1',
    jobTitle: 'Video Editor for youtube videos',
    jobDescription:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. lvoluptatem.',
    jobBudget: '\$80',
    jobLevel: 'Experienced',
    jobExecutionTime: 'Less than month',
    jobTime: '20:00 PM',
    isSaved: false,
  ),
];
