class Vehicle{
  String id;
  final String vehicleNumber;
  final String departmentNumber;
  final String registrationNumber;
  final String division;
  final String modal;
  final String type;
  final String state;
  final String oparatorName;
  final String oparatingWeight;
  final String consumption;
  final String remark;


  Vehicle({
    required this.id,
    required this.vehicleNumber,
    required this.departmentNumber,
    required this.registrationNumber,
    required this.division,
    required this.modal,
    required this.type,
    required this.state,
    required this.oparatorName,
    required this.oparatingWeight,
    required this.consumption,
    required this.remark});


  Map<String,dynamic> toJson() =>{
    'id':id,
    'vehicleNumber' : vehicleNumber,
    'departmentNumber' : departmentNumber,
    'registrationNumber' : registrationNumber,
    'division' : division,
    'modal' : modal,
    'type' : type,
    'state' : state,
    'oparatorName' : oparatorName,
    'oparationWeight' : oparatingWeight,
    'consumption' : consumption,
    'remark' : remark,
  };

  static Vehicle fromJson(Map<String,dynamic>json) => Vehicle(
      id:json['id'],
      vehicleNumber: json['vehicleNumber'],
      departmentNumber: json['departmentNumber'],
      registrationNumber: json['registrationNumber'],
      division: json['division'],
      modal: json['modal'],
      type: json['type'],
      state: json['state'],
      oparatorName: json['oparatorName'],
      oparatingWeight: json['oparationWeight'],
      consumption: json['consumption'],
      remark: json['remark']
  );

  static String getDivision(Map<String,dynamic>json) => json['division'];

  static List<String> getVehicleTypeList()=> [
    "Backhoe Loader",
    "Crawler Excavator",
    "Motor Grader",
    "Crawler Excavator Long arm",
    "Crawler Excavator with barge",
    "Double Drum Vibrating Roller",
    "Sheep foot Roller",
    "Front End Loader",
    "Tractor",
    "Amblibious weed cutter",
    "Amblibious weed Harvester"
  ];

  static List<String> getVehicleModalList()=> [
  "JCB-3CX",
  "JCB-3DX",
  "CAT-428",
  "Kobelco-SK35",
  "Kobelco-SK40",
  "Kobelco-SK70",
  "Kobelco-SK75",
  "Kobelco-SK120",
  "Kobelco-SK125",
  "Kobelco-SK135",
  "Kobelco-SK175",
  "Kobelco-SK200",
  "Kobelco-SK225",
  "Doosan-DX55",
  "Doosan-DX75",
  "Doosan-DX80",
  "Doosan-DX140",
  "Doosan-DX210",
  "Doosan-DX225",
  "Komatsu-PC 70",
  "Komatsu-PC200",
  "Catepiller-312D",
  "Catepiller-53D",
  "Catepiller-320D",
  "JCB-JS140",
  "Link belt-2800B",
  "Catepiller-D155",
  "Catepiller-D4",
  "Catepiller-D5",
  "Catepiller-D6",
  "Catepiller-D7",
  "Catepiller-D8",
  "Komatsu-D4",
  "Komatsu-D5",
  "Komatsu-D6",
  "Komatsu-D7",
  "Komatsu-D8",
  "Mitsubishi-MG330",
  "Mitsubishi-MG230",
  "Komatsu-GD511",
  "Hamm-HD70",
  "Sakai-SV512",
  "Vibromax-VM186",
  "Bommag-BW219",
  "Bommag-BW211",
  "CAT-CS533",
  "JCB-436",
  "Catepiller-936",
  "Komatsu-WA120",
  "Komatsu-WA180",
  "Kobelco-LK150",
  "Tafe-45DI",
  "Mahendra-475DI",
  "Mahendra-575DI",
  "Mahendra-275DI",
  "Massey ferguson-MF135",
  "Massey ferguson-MF240",
  "Massey ferguson-MF250",
  "Massey ferguson-350DI",
  "Berky-6450",
  "Berky-6925"
  ];
}