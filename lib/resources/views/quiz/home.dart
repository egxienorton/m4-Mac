import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_controller.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_state.dart';
import 'package:xiphone/App/Models/quiz_model.dart';
import 'package:xiphone/database/dum_dums/quiz_dums_list.dart';
import 'package:xiphone/resources/widgets/button_inset.dart';

import 'quiz_questions.dart';
import 'result_screen.dart';

class QuizScreen extends HookConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final quizQuestions = ref.watch(quizProvider);
    // print(quizQuestions);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('The Ultimate Quiz by egxie'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                              Color.fromARGB(244, 199, 212, 19),
                              Color(0xFF0652C5)
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: quizQuestions.isEmpty
                            ? Text(
                                'No questions',
                                style: TextStyle(fontSize: 48),
                              )
                            : _buildBody(
                                context, ref, pageController, quizQuestions)),
                  ],
                ),
              ),
            ),

            //  ElevatedButton(
            //     onPressed: () {},
            //     child: Row(
            //       children: [
            //         Text(
            //           'Start Quiz',
            //           style: TextStyle(fontSize: 32),
            //         ),
            //         Icon(Icons.play_arrow)
            //       ],
            //     ))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SButton(title: 'Next Question', onTap: () {}),
            )
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<QuizModel> quizQuestions) {
    if (quizQuestions.isEmpty)
      return Center(
        child: Text('No questions found'),
      );

    final quizState = ref.read(quizControllerProvider);

    // return quizState.status == QuizStatus.complete;
        // ? QuizResults(state: quizState, questions: quizQuestions)
        // : QuizQuestions(pageController: pageController, state:quizState, questions:quizQuestions);
  }
}
