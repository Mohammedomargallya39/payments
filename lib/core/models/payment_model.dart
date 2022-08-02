class PaymentModel {
  String? id;
  String? actionId;
  int? amount;
  String? currency;
  bool? approved;
  String? status;
  String? authCode;
  String? responseCode;
  String? responseSummary;
  Risk? risk;
  String? processedOn;
  String? reference;
  Processing? processing;
  String? eci;
  String? schemeId;

  PaymentModel(
      {this.id,
        this.actionId,
        this.amount,
        this.currency,
        this.approved,
        this.status,
        this.authCode,
        this.responseCode,
        this.responseSummary,
        this.risk,
        this.processedOn,
        this.reference,
        this.processing,
        this.eci,
        this.schemeId});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actionId = json['action_id'];
    amount = json['amount'];
    currency = json['currency'];
    approved = json['approved'];
    status = json['status'];
    authCode = json['auth_code'];
    responseCode = json['response_code'];
    responseSummary = json['response_summary'];
    risk = json['risk'] != null ? Risk.fromJson(json['risk']) : null;
    processedOn = json['processed_on'];
    reference = json['reference'];
    processing = json['processing'] != null
        ? Processing.fromJson(json['processing'])
        : null;
    eci = json['eci'];
    schemeId = json['scheme_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['action_id'] = actionId;
    data['amount'] = amount;
    data['currency'] = currency;
    data['approved'] = approved;
    data['status'] = status;
    data['auth_code'] = authCode;
    data['response_code'] = responseCode;
    data['response_summary'] = responseSummary;
    if (risk != null) {
      data['risk'] = risk!.toJson();
    }
    data['processed_on'] = processedOn;
    data['reference'] = reference;
    if (processing != null) {
      data['processing'] = processing!.toJson();
    }
    data['eci'] = eci;
    data['scheme_id'] = schemeId;
    return data;
  }
}

class Risk {
  bool? flagged;

  Risk({this.flagged});

  Risk.fromJson(Map<String, dynamic> json) {
    flagged = json['flagged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flagged'] = flagged;
    return data;
  }
}

class Processing {
  String? retrievalReferenceNumber;
  String? acquirerTransactionId;
  String? recommendationCode;

  Processing(
      {this.retrievalReferenceNumber,
        this.acquirerTransactionId,
        this.recommendationCode});

  Processing.fromJson(Map<String, dynamic> json) {
    retrievalReferenceNumber = json['retrieval_reference_number'];
    acquirerTransactionId = json['acquirer_transaction_id'];
    recommendationCode = json['recommendation_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['retrieval_reference_number'] = retrievalReferenceNumber;
    data['acquirer_transaction_id'] = acquirerTransactionId;
    data['recommendation_code'] = recommendationCode;
    return data;
  }
}