class PageModel{

  bool onceClicked;
  bool onceFormSubmitted;

  PageModel({this.onceClicked,this.onceFormSubmitted}){
    onceClicked = false;
    onceFormSubmitted = false;
  }
}