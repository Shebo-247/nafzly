class JobPost {
  String jobID,
      jobOwnerID,
      jobTitle,
      jobDescription,
      jobBudget,
      jobExecutionTime,
      jobLevel,
      jobTime;
  bool isSaved;

  JobPost({
    this.jobID,
    this.jobOwnerID,
    this.jobTitle,
    this.jobDescription,
    this.jobBudget,
    this.jobExecutionTime,
    this.jobLevel,
    this.jobTime,
    this.isSaved
  });

  String get getJobID => this.jobID;
  String get getJobOwner => this.jobOwnerID;
  String get getJobTitle => this.jobTitle;
  String get getJobDescription => this.jobDescription;
  String get getJobBidget => this.jobBudget;
  String get getJobExecutionTime => this.jobExecutionTime;
  String get getJobLevel => this.jobLevel;
  String get getJobTime => this.jobTime;
}
