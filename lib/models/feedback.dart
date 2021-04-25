class FeedbackModel{

  int id;
  int userId;
  int mobileUserDetailsId;
  String createdDate;
  String createdBy;
  double overallExperience;
  double reservationExperience;
  double staffEfficiency;
  double eventsOrganisation;
  double valueOfExperience;
  String overallComments;

  FeedbackModel({
    this.id,
    this.userId,
    this.mobileUserDetailsId,
    this.createdDate,
    this.createdBy,
    this.overallExperience,
    this.reservationExperience,
    this.staffEfficiency,
    this.eventsOrganisation,
    this.valueOfExperience,
    this.overallComments,
  });

  FeedbackModel.fromJson(Map<String, dynamic> json)
      :id=json['id'],
        userId=json['user_id'],
        mobileUserDetailsId=json['mobile_user_details_id'],
        createdDate=json['create_date'],
        createdBy=json['create_by'],
        overallExperience=json['overall_experience'],
        reservationExperience=json['reservation_experience'],
        staffEfficiency=json['staff_efficiency'],
        eventsOrganisation=json['events_organisation'],
        valueOfExperience=json['value_of_experience'],
        overallComments=json['overall_comments'];

  Map<String, dynamic> toJson() => {
    'id':id,
    'user_id':userId,
    'mobile_user_details_id':mobileUserDetailsId,
    'created_date':createdDate,
    'created_by':createdBy,
    'overall_experience':overallExperience,
    'reservation_experience':reservationExperience,
    'staff_efficiency':staffEfficiency,
    'events_organisation':eventsOrganisation,
    'value_of_experience':valueOfExperience,
    'overall_comments':overallComments,
  };
}