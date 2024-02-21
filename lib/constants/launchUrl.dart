import 'package:portfolio/constants/url.dart';
import 'package:url_launcher/url_launcher.dart';

void launchGitHub() async {
  if (await canLaunch(Links.githubLink)) {
    await launch(Links.githubLink);
  } else {
    throw 'Could not launch ${Links.githubLink}';
  }
}

void launchLinkedin() async {
  if (await canLaunch(Links.linkedinLink)) {
    await launch(Links.linkedinLink);
  } else {
    throw 'Could not launch ${Links.linkedinLink}';
  }
}

void launchTwitter() async {
  if (await canLaunch(Links.twitterLink)) {
    await launch(Links.twitterLink);
  } else {
    throw 'Could not launch ${Links.twitterLink}';
  }
}

void launchResumeLink() async {
  if (await canLaunch(Links.resumeLink)) {
    await launch(Links.resumeLink);
  } else {
    throw 'Could not launch ${Links.resumeLink}';
  }
}
