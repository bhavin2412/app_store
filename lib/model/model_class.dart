class AppModel
{
  String? name,company,size,download,about,imagepath,firstimage;
  int? rate,page;
  List? image=[];
  AppModel(
      {this.name,
        this.company,
        this.size,
        this.download,
        this.about,
        this.imagepath,this.firstimage,this.image,this.rate,this.page});
}