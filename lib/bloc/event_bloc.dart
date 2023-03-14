part of 'portfolio_bloc.dart';
abstract class ViewEvents{

}

class ProjectInitial extends ViewEvents{
  ProjectInitial();
}

class Resume extends ViewEvents{
  Resume();
}
class Contact extends ViewEvents{
  Contact();
}
class ViewProject extends ViewEvents{
  String projectName;
  ViewProject( {
    required this.projectName
});
}
class Data extends ViewEvents{

Data();
}
class Git extends ViewEvents{

  Git();
}



