part of 'portfolio_bloc.dart';
abstract class ViewState{

}
class PortfolioInitialState extends ViewState{
  PortfolioInitialState();
}
class ViewProjectInitialState extends ViewState{
  List name,description,link;
  ViewProjectInitialState(
      {required this.name, required this.description, required this.link});

}
class ResumeState extends ViewState{
  ResumeState();
}
class ContactState extends ViewState{
  ContactState();
}
class ViewProjectState extends ViewState{
  ViewProjectState();

}
class DataState extends ViewState{
  DataState();
}
class GitState extends ViewState{
  GitState();
}