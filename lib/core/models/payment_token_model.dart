class PaymentTokenModel {
  String? type;
  String? token;
  String? expiresOn;
  int? expiryMonth;
  int? expiryYear;
  String? scheme;
  String? schemeLocal;
  String? last4;
  String? bin;
  String? cardType;
  String? cardCategory;
  String? issuer;
  String? issuerCountry;
  String? productId;
  String? productType;
  BillingAddress? billingAddress;
  Phone? phone;
  String? name;

  PaymentTokenModel(
      {this.type,
        this.token,
        this.expiresOn,
        this.expiryMonth,
        this.expiryYear,
        this.scheme,
        this.schemeLocal,
        this.last4,
        this.bin,
        this.cardType,
        this.cardCategory,
        this.issuer,
        this.issuerCountry,
        this.productId,
        this.productType,
        this.billingAddress,
        this.phone,
        this.name});

  PaymentTokenModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
    expiresOn = json['expires_on'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    scheme = json['scheme'];
    schemeLocal = json['scheme_local'];
    last4 = json['last4'];
    bin = json['bin'];
    cardType = json['card_type'];
    cardCategory = json['card_category'];
    issuer = json['issuer'];
    issuerCountry = json['issuer_country'];
    productId = json['product_id'];
    productType = json['product_type'];
    billingAddress = json['billing_address'] != null
        ? BillingAddress.fromJson(json['billing_address'])
        : null;
    phone = json['phone'] != null ? Phone.fromJson(json['phone']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['token'] = token;
    data['expires_on'] = expiresOn;
    data['expiry_month'] = expiryMonth;
    data['expiry_year'] = expiryYear;
    data['scheme'] = scheme;
    data['scheme_local'] = schemeLocal;
    data['last4'] = last4;
    data['bin'] = bin;
    data['card_type'] = cardType;
    data['card_category'] = cardCategory;
    data['issuer'] = issuer;
    data['issuer_country'] = issuerCountry;
    data['product_id'] = productId;
    data['product_type'] = productType;
    if (billingAddress != null) {
      data['billing_address'] = billingAddress!.toJson();
    }
    if (phone != null) {
      data['phone'] = phone!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class BillingAddress {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? zip;
  String? country;

  BillingAddress(
      {this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.zip,
        this.country});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    return data;
  }
}

class Phone {
  String? countryCode;
  String? number;

  Phone({this.countryCode, this.number});

  Phone.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_code'] = countryCode;
    data['number'] = number;
    return data;
  }
}