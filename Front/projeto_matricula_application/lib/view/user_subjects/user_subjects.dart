import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/view/user_subjects/widgets/subject_item.dart';

class UserSubjects extends StatelessWidget {
  final List<SubjectDto> subjects = [
    SubjectDto(
        name: 'Cálculo I',
        shift: SubjectShiftEnum.noite,
        numberStudents: 15,
        hours: 40),
    SubjectDto(
        name: 'AEDS I',
        shift: SubjectShiftEnum.noite,
        numberStudents: 15,
        hours: 40),
    SubjectDto(
        name: 'Trabalho Interdisciplinar',
        shift: SubjectShiftEnum.noite,
        numberStudents: 15,
        hours: 40),
    SubjectDto(
        name: 'Introdução a ESW',
        shift: SubjectShiftEnum.noite,
        numberStudents: 15,
        hours: 40),
  ];

  final List<List<Color>> gradients = [
    [Color(0xFFFFD1DC), Color(0xFFFFC0CB)], 
    [Color(0xFFFFE4B5), Color(0xFFFFDAB9)],
    [Color(0xFFB0E0E6), Color(0xFFAFEEEE)], 
    [Color(0xFFF0E68C), Color(0xFFFFFACD)], 
  ];

  UserSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // title: const Text(
        //   'Matérias',
        //   style: TextStyle(
        //       color: ProjectColors.primaryColor, fontWeight: FontWeight.bold),
        // ),
        // centerTitle: false,
        leading: IconButton(
          icon: const HeroIcon(
            HeroIcons.chevronLeft,
            color: ProjectColors.primaryLight,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 340,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: ProjectColors.buttonColor,
                  ),
                ),
              )),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                child: RichText(
                  text: TextSpan(
                    text: 'Olá, ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[700],
                    ),
                    children: [
                      TextSpan(
                        text: Context.current.nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: '!\nEssas são as suas matérias.',
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final gradientColors = gradients[index % gradients.length];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SubjectItem(
                          subject: subjects[index],
                          gradientColors: gradientColors),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}