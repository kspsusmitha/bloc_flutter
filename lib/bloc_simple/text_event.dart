abstract class TextEvent {}

class UpdateText extends TextEvent {
  String text;
  UpdateText(this.text);
}
