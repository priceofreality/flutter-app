import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String label;
  // Map financial Situation => cost
  final Map<int,double> costMin;
  final Map<int,double> costMax;

  const Choice({required this.id, required this.label, required this.costMin, required this.costMax});

  factory Choice.fromTuple(Map<String, dynamic> choiceTuple,List<Map<String, dynamic>> financialChoiceCostsTuples){

    Map<int,double> costMin = {};
    Map<int,double> costMax = {};
    for(Map<String, dynamic> tuple in financialChoiceCostsTuples){
      if(tuple['choice'] == choiceTuple['choice']){
        costMin[tuple['financial_situation']] = tuple['costMin'];
        if(tuple['costMax'] != null){
          costMax[tuple['financial_situation']] = tuple['costMin'];
        }
      }
    }
    return Choice(
      id: choiceTuple['id'],
      label: choiceTuple['label'],
      costMin: costMin,
      costMax: costMax
    );
  }
  @override
  String toString() {
    return "${this.label}, ${this.costMin}, ${this.costMax}";
  }

  @override
  List<Object> get props => [id];
}
