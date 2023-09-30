
import 'package:get/get.dart';

import '../utils/prompt.dart';

class PromptController extends GetxController {
  final prompts = <Prompt>[].obs;

  @override
  void onInit() async {
    prompts.value = await getPrompts();
    super.onInit();
  }
}

class Prompt {
  final String act;
  final String prompt;

  Prompt(this.act, this.prompt);
}
