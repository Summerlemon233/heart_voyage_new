import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "appTitle": "ChatGpt",
          "toSecondPage": "to second page",
          "secondPage": "this is the second Page",
          "countTimes": "current total count is:",
          "noConversationTips":
              "There seems to be no session, click on the left to create one quickly, or simply type prompt to create one",
          "newConversation": "New Conversation",
          "renameConversation": "Rename Conversation",
          "enterNewName": "Enter new name",
          "settings": "Settings",
          "theme": "switch theme",
          "language": "switch language",
          "delete": "Delete",
          "reName": "ReName",
          "inputPrompt": "Input your prompt",
          "inputPromptTips": "Input your prompt here",
          "enterKey": "Enter the chatgpt key",
          "enterKeyTips": "Enter the chatgpt key here",
          "setProxyUrl": "Enter the proxy url",
          "setProxyUrlTips": "Select the proxy url here.",
          "ok": "OK",
          "cancel": "Cancel",
          "useStreamApi": "Use Stream API",
          "gptModel": "Select GPT Model",
          "llmHint": "Select LLM Model",
          "youCode": "please input your you code",
          "youCodeTips": "yk-xxxx-xxxx-xxxx-xxxx"
        },
        'zh_CN': {
          "appTitle": "和心宠聊天",
          "toSecondPage": "第二页",
          "secondPage": "前往第二页",
          "countTimes": "当前的数字是：",
          "noConversationTips": "似乎没有会话。点击左侧快速创建一个，或简单地键入提示创建一个",
          "newConversation": "创建新会话",
          "renameConversation": "重命名会话",
          "enterNewName": "输入新的名字",
          "settings": "设置",
          "theme": "切换主题",
          "language": "切换语言",
          "delete": "删除",
          "reName": "重命名",
          "inputPrompt": "请输入您的提示词",
          "inputPromptTips": "在这里输入您的提示词",
          "enterKey": "请输入您的OpenAI API Key（如果能正常使用可不更改）",
          "enterKeyTips": "请在这里输入您的OpenAI API Key",
          "setProxyUrl": "请输入反向代理URL",
          "setProxyUrlTips": "请在这里设置反向代理URL",
          "ok": "确定",
          "cancel": "取消",
          "useStreamApi": "使用流式(Stream) API",
          "useWebSearch": "使用 Web 搜索",
          "gptModel": "选择 GPT Model",
          "llmHint": "选择大语言模型",
          "youCode": "请输入You邀请码",
          "youCodeTips": "yk-xxxx-xxxx-xxxx-xxxx"
        }
      };
}
