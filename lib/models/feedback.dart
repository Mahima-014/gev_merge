class FeedbackModel{

  int id;
  int userId;
  int mobileUserDetailsId;
  String createdDate;
  String createdBy;
  double overallExperience;
  String overallComments;
  double reservationExperience;
  String reservationComments;
  double staffEfficiency;
  String staffComments;
  double eventsOrganisation;
  String eventsComments;
  double valueOfExperience;
  String valueComments;
  String generalComments;
  String visitDate;


  FeedbackModel({
    this.id,
    this.userId,
    this.mobileUserDetailsId,
    this.createdDate,
    this.createdBy,
    this.overallExperience,
    this.overallComments,
    this.reservationExperience,
    this.reservationComments,
    this.staffEfficiency,
    this.staffComments,
    this.eventsOrganisation,
    this.eventsComments,
    this.valueOfExperience,
    this.valueComments,
    this.generalComments,
    this.visitDate,
  });

  FeedbackModel.fromJson(Map<String, dynamic> json)
      :id=json['id'],
        userId=json['user_id'],
        mobileUserDetailsId=json['mobile_user_details_id'],
        createdDate=json['create_date'],
        createdBy=json['create_by'],
        overallExperience=json['overall_experience'],
        overallComments=json['overall_comments'],
        reservationExperience=json['reservation_experience'],
        reservationComments=json['reservation_comments'],
        staffEfficiency=json['staff_efficiency'],
        staffComments=json['staff_comments'],
        eventsOrganisation=json['events_organisation'],
        eventsComments=json['events_comments'],
        valueOfExperience=json['value_of_experience'],
        valueComments=json['value_comments'],
        generalComments=json['general_comments'],
        visitDate=json['visit_date'];

  Map<String, dynamic> toJson() => {
    'id':id,
    'user_id':userId,
    'mobile_user_details_id':mobileUserDetailsId,
    'created_date':createdDate,
    'created_by':createdBy,
    'overall_experience':overallExperience,
    'overall_comments':overallComments,
    'reservation_experience':reservationExperience,
    'reservation_comments':reservationComments,
    'staff_efficiency':staffEfficiency,
    'staff_comments':staffComments,
    'events_organisation':eventsOrganisation,
    'events_comments':eventsComments,
    'value_of_experience':valueOfExperience,
    'value_comments':valueComments,
    'general_comments':generalComments,
    'visit_date':visitDate,
  };
}