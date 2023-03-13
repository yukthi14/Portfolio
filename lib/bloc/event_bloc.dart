part of 'portfolio_bloc.dart';
abstract class ViewEvents{

}
class PortfolioInitialState extends ViewState{
  PortfolioInitialState();
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


