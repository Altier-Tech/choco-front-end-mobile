import 'package:dart_openai/dart_openai.dart';

import 'chat_message_model.dart';

class ChatApi {
  static const _model = 'gpt-3.5-turbo';

  ChatApi() {
    OpenAI.apiKey = "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";
    OpenAI.organization = "org-DTJH8ZiHIIprfoidG7CARkMD";
  }

  Future<String> completeChat(List<ChatMessage> messages) async {
    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: messages
          .map((e) => OpenAIChatCompletionChoiceMessageModel(
                role: e.isUserMessage
                    ? OpenAIChatMessageRole.user
                    : OpenAIChatMessageRole.assistant,
                content: e.content,
              ))
          .toList(),
    );
    return chatCompletion.choices.first.message.content;
  }
}
