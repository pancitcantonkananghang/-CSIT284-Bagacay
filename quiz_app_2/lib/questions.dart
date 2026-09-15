import 'quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    ['Widgets', 'Components', 'Blocks', 'Functions'],
  ),
  QuizQuestion(
    'How are Flutter UIs built?',
    [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By using XCode for iOS and Android Studio for Android',
      'By defining widgets in config files',
    ],
  ),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Render UI that does not depend on data',
      'Ignore data changes',
      'Render static components only',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both equally',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The app crashes',
      'The parent widget updates',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateUI()',
      'By calling updateData()',
      'By calling updateState()',
    ],
  ),
];