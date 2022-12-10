/*
    Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: AppColors.BackgroundColor,
              elevation: 4,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(28.0),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      radius: 18.0,
                                      //#D9D9D9
                                      backgroundColor: AppColors.CircleBgColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "User's Full name",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/home.png",
                                            width: 14.0,
                                            height: 14.0,
                                            color: Colors.white,
                                          ),

                                          // const Icon(
                                          //   Icons.home_outlined,
                                          //   color: Colors.white70,
                                          //   size: 14.0,
                                          // ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "Residence",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10.0,
                                              color: AppColors.CircleBgColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/map.png",
                                            width: 14.0,
                                            height: 14.0,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "LiveIn",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10.0,
                                              color: AppColors.CircleBgColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 12, 0, 4),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "ACTUAL",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10.0,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\u{20B9}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "1,500",
                                      style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   width: 34.0,
                            // ),
                            Column(
                              children: [
                                Text(
                                  "ACTUAL",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10.0,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\u{20B9}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "1300",
                                      style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "ACTUAL",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10.0,
                                      color: AppColors.blackcolor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\u{20B9}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "200",
                                      style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "History",
                    style: GoogleFonts.roboto(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackcolor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 160.0,
                ),
                Text("Unpaid",
                    style: GoogleFonts.roboto(
                      fontSize: 12.0,
                      color: AppColors.blackcolor,
                    )),
                const SizedBox(
                  width: 20.0,
                ),

                Switch(
                  value: viewAdminUsers,
                  onChanged: (value) {
                    setState(() {
                      viewAdminUsers = value;
                      print(viewAdminUsers);
                    });
                  },
                  activeTrackColor: Colors.blue,
                  activeColor: Colors.green,
                ),

                // testdatatext()
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(),
            const SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Party full name",
                        style:
                            //          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 3, 3, 3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\u{20B9}' "100",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  const SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Date: 19th august, 2022",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.TextColor,

                              // fontSize: 14.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60.0),
                            child: Text(
                              "Bayad, gujrat",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.TextColor,

                                // fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIButton(
                        color: AppColors.BackgroundColor,
                        labelText: "PAY NOW",
                        style: GoogleFonts.roboto(
                          letterSpacing: 2.0,
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  //
                  //
                ],
              ),
            ),
            // second
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "full name",
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 3, 3, 3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\u{20B9}' "100",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  const SizedBox(
                    height: 2.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Date: 19th august, 2022",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.TextColor,

                              // fontSize: 14.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60.0),
                            child: Text(
                              "Gabat, gujrat",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.TextColor,

                                // fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIButton(
                        color: AppColors.BackgroundColor,
                        labelText: "PAY NOW",
                        style: GoogleFonts.roboto(
                          letterSpacing: 2.0,
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  //
                  //
                ],
              ),
            ),
            // third

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Party full name",
                        style:
                            //        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 3, 3, 3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          '\u{20B9}' "100",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  const SizedBox(
                    height: 2.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Date: 19th august, 2022",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.TextColor,

                              // fontSize: 14.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60.0),
                            child: Text(
                              "Gabat, gujrat",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.TextColor,

                                // fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIButton(
                        color: AppColors.BackgroundColor,
                        labelText: "PAY NOW",
                        style: GoogleFonts.roboto(
                          letterSpacing: 2.0,
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  //
                  //
                ],
              ),
            ),
            // fourth
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Party full name",
                        style:
                            //        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 3, 3, 3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\u{20B9}' "100",
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  //
                  const SizedBox(
                    height: 2.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Date: 19th august, 2022",
                            style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.TextColor,

                              // fontSize: 14.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60.0),
                            child: Text(
                              "Gabat, gujrat",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.TextColor,

                                // fontSize: 14.0,
                              ),
                              //
                            ),
                          ),
                        ],
                      ),
                      UIButton(
                        color: AppColors.BackgroundColor,
                        labelText: "PAY NOW",
                        style: GoogleFonts.roboto(
                          letterSpacing: 2.0,
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  //
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    ),
*/