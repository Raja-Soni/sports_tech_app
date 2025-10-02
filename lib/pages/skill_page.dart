import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_tech_app/bloc/online_database/db_bloc.dart';
import 'package:sports_tech_app/bloc/online_database/db_event.dart';
import 'package:sports_tech_app/bloc/online_database/db_state.dart';
import 'package:sports_tech_app/utils/enums.dart';

import '../AppColors/AppColor.dart';
import '../custom_widgets/carousel.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});
  @override
  State<SkillPage> createState() => SkillPageState();
}

class SkillPageState extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sports Tech App",
            style: GoogleFonts.montserrat(
              color: AppColor.titleTextWhiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<DBBloc, DBState>(
          builder: (context, skillState) {
            if (skillState.apiStatus == ApiStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.circularProgressBarBlackColor,
                ),
              );
            } else if (skillState.apiStatus == ApiStatus.error) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Text(
                      skillState.errorMessage.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            } else {
              context.read<DBBloc>().add(GetBasicSkillData());
              context.read<DBBloc>().add(GetIntermediateSkillData());
              context.read<DBBloc>().add(GetAdvanceSkillData());
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (skillState.basicSkillData != null)
                      buildCarousel(
                        "Basic Skills",
                        skillState.basicSkillData!,
                        context,
                      ),
                    if (skillState.intermediateSkillData != null)
                      buildCarousel(
                        "Intermediate Skills",
                        skillState.intermediateSkillData!,
                        context,
                      ),
                    if (skillState.advanceSkillData != null)
                      buildCarousel(
                        "Advanced Skills",
                        skillState.advanceSkillData!,
                        context,
                      ),
                    if (skillState.basicSkillData == null &&
                        skillState.intermediateSkillData == null &&
                        skillState.advanceSkillData == null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "No skills available",
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
