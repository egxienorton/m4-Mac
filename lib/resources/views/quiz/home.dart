import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_controller.dart';
import 'package:xiphone/App/Controllers/Quiz/quiz_state.dart';
import 'package:xiphone/App/Models/quiz_model.dart';
import 'package:xiphone/database/dum_dums/quiz_dums_list.dart';
import 'package:xiphone/resources/widgets/button_inset.dart';

import '../../ui_presets/box_shadows.dart';
import '../../ui_presets/buttons/custom_buttons.dart';
import 'quiz_questions.dart';
import 'quiz_results.dart'; 

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final quizState = ref.watch(quizControllerProvider);
    final quizStateNotifier = ref.watch(quizControllerProvider.notifier);
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SButton(title: 'Next Question', onTap: () {}),
            // )
          ],
        ),
      ),

        bottomSheet: quizQuestions.isEmpty
          ?
            
            Column(
              children: [
            if(!quizState.answered) const SizedBox.shrink()

              ],
            ):
             CustomButton(
              title: pageController.page!.toInt() + 1 < quizQuestions.length
                  ? 'Next Question'
                  : 'See Results',
              onTap: () {
               quizStateNotifier
                    .nextQuestion(quizQuestions, pageController.page!.toInt());
                if (pageController.page!.toInt() + 1 < quizQuestions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
            )
        //  : () => const SizedBox.shrink(),
        
    );
  }

  _buildBody(BuildContext context, WidgetRef ref, PageController pageController,
      List<QuizModel> quizQuestions) {
    if (quizQuestions.isEmpty)
      return Center(
        child: Text('No questions found'),
      );

    final quizState = ref.watch(quizControllerProvider);

    return quizState.status == QuizStatus.complete
    ? QuizResults(state: quizState, questions: quizQuestions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: quizQuestions,
          );
        // ? QuizResults(state: quizState, questions: quizQuestions)
        // : QuizQuestions(pageController: pageController, state:quizState, questions:quizQuestions);
  }
}

class QuizQuestions extends ConsumerWidget {
  final PageController pageController;
  final QuizState state;
  final List<QuizModel> questions;

  const QuizQuestions({
    Key? key,
    required this.pageController,
    required this.state,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizController = ref.watch(quizControllerProvider.notifier);
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                question.question,
                // HtmlCharacterEntities.decode(question.question),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Column(
              children: question.answers
                  .map(
                    (e) => AnswerCard(
                      answer: e,
                      isSelected: e == state.selectedAnswer,
                      isCorrect: e == question.correctAnswer,
                      isDisplayingAnswer: state.answered,
                      onTap: () => 
                          quizController
                          .submitAnswer(question, e),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class AnswerCard extends ConsumerWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback onTap;

  const AnswerCard({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayingAnswer,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow,
          border: Border.all(
            color: isDisplayingAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                // HtmlCharacterEntities.decode(answer),
                answer,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: isDisplayingAnswer && isCorrect
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ?  CircularIcon(icon: Icons.check, color: Colors.green)
                  : isSelected
                      ?  CircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                        )
                      : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CircularIcon({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16.0,
      ),
    );
  }
}
