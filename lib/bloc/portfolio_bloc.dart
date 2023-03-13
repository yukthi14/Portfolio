import 'package:bloc/bloc.dart';
import '../constants/string.dart';
import '../constants/url.dart';
part 'state_bloc.dart';
part 'event_bloc.dart';

class PortfolioBloc extends Bloc <ViewEvents,ViewState>{
  PortfolioBloc():super(PortfolioInitialState()){
    on<Resume>((event,emit)async{
      try{
        var url=Uri.http(Links.resumeLink);

      }
      catch(e){
        throw Exception(e);
      }
      emit(ResumeState());
    });
    on<ViewProject>((event,emit)async{
      try{
        if(event.projectName==Strings.studentContact){
          var url=Uri.http(Links.studentContactLink);
          print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
          emit(ViewProjectState());

        }
        else if(event.projectName==Strings.dataStructure){
          var url=Uri.http(Links.dataStructureLink);
          emit(ViewProjectState());
        }
        else if(event.projectName==Strings.calculator){
          var url=Uri.http(Links.calculatorLink);
          emit(ViewProjectState());
        }
        else if (event.projectName==Strings.blocConnection){
            var url=Uri.http(Links.blocConnectionLink);
            emit(ViewProjectState());
        }
      }
      catch(e){
        throw Exception(e);
      }
    });
  }

}