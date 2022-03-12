import 'package:flutter/material.dart';

//4.Define seperate list widget and use it as template
Widget customListView({
  required String title,
  required String singer,
  required String image,
  onTap,
}) {
  return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15,top: 15,),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3E2B63),
              //border: Border.all(color: Colors.grey.shade500),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0) //                 <--- border radius here
            ),
          ),
          child: Row(
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    //color: Color(0XFF2b194d)
                  ),
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                      child: Image(image: AssetImage("assets/6.png"), fit: BoxFit.cover),
                  ),
                ),

              ]),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.normal,
                        fontSize: 17.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8.0),

                  ],
                ),
              ),
              //Spacer(),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.6),
                size: 22.0,
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
  );
}
