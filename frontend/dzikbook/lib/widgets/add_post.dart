import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  final String userImage;
  AddPost(this.userImage);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          this.userImage,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: new ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 130.0,
                            ),
                            child: new Scrollbar(
                              child: new SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: false,
                                child: SizedBox(
                                  child: new TextFormField(
                                    maxLines: 20,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Co słychać?',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        onPressed: () => {},
                        child: Text("OPUBLIKUJ",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        color: Color.fromRGBO(33, 150, 83, 1.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        onPressed: () => {},
                        child: Text(
                          "zdjęcie/film",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        color: Color.fromRGBO(126, 213, 111, 1.0),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                        ),
                        onPressed: () => {},
                        child: Text(
                          "trening",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        color: Color.fromRGBO(126, 213, 111, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
