import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/string.dart';
import '../constants/url.dart';
part 'state_bloc.dart';
part 'event_bloc.dart';

class PortfolioBloc extends Bloc <ViewEvents,ViewState>{
  PortfolioBloc():super(PortfolioInitialState()){
    on<ProjectInitial>((event,emit)async{
      List name=Lists.projectNameLists;
      List description=Lists.projectDescLists;
      List link=Lists.projectLinkLists;
      emit(ViewProjectInitialState(name: name, description: description, link:link));
    }
    );
    on<Resume>((event,emit)async{
      try{
        var url=Uri.parse(Links.resumeLink);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }

      }
      catch(e){
        throw Exception(e);
      }
      emit(ResumeState());
    });
    on<ViewProject>((event,emit)async{
      try{
        if(event.projectName==Strings.studentContact){
          var url=Uri.parse(Links.studentContactLink);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
          // else{
          //   throw 'could  not launch $url';
          // }
          emit(ViewProjectState());
        }
        else if(event.projectName==Strings.dataStructure){
          var url=Uri.parse(Links.dataStructureLink);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
          emit(ViewProjectState());
        }
        else if(event.projectName==Strings.calculator){
          var url=Uri.parse(Links.calculatorLink);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
          emit(ViewProjectState());
        }
        else if (event.projectName==Strings.blocConnection){
            var url=Uri.parse(Links.blocConnectionLink);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
            emit(ViewProjectState());
        }
      }
      catch(e){
        throw Exception(e);
      }
    });
    on<Data>((event,emit)async{
      try{
        var url=Uri.parse(Links.linkedinLink);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      }
      catch(e){
        throw Exception(e);
      }
      emit(DataState());
    });
    on<Git>((event,emit)async{
      try{
        var url=Uri.parse(Links.githubLink);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      }
      catch(e){
        throw Exception(e);
      }
      emit(GitState());
    });
  }
}