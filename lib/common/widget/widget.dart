import 'package:flutter/material.dart';

///============ Build Text Field
class BuildTextField extends StatefulWidget {
  final String hintText;
  final TextInputType textType;
  final Function(String)? onValueChanged;

  const BuildTextField({
    required this.hintText,
    this.textType = TextInputType.text,
    this.onValueChanged,
  });

  @override
  BuildTextFieldState createState() => BuildTextFieldState();
}

class BuildTextFieldState extends State<BuildTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 44,
      child: TextField(
        obscureText:
            widget.textType == TextInputType.visiblePassword && obscureText
                ? true
                : false,
        keyboardType: widget.textType,
        decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF6F6F6),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF6F6F6),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF6F6F6),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFF6F6F6),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            hintStyle: const TextStyle(color: Color(0xFF969696)),
            suffixIcon: widget.textType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    color: Color(0xFF0560FD),
                  )
                : widget.textType == TextInputType.name
                    ? IconButton(
                        icon: Image.asset(
                          'assets/images/Polygon 1.png',
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        color: Color(0xFF0560FD),
                      )
                    : null),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        autocorrect: false,
        onChanged: (value) {
          if (widget.onValueChanged != null) {
            widget.onValueChanged!(value);
          }
        },
      ),
    );
  }
}

///============ Build Text
Widget reusableText(String text,
    {EdgeInsetsGeometry margin = const EdgeInsets.only(left: 22, bottom: 5),
    double fontSize = 14,
    Color defaultColor = Colors.black}) {
  return Container(
    margin: margin,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        color: defaultColor,
      ),
    ),
  );
}

///============ Build log button
Widget buildLogInAndRegButton(String buttonName, void Function()? func) {
  return GestureDetector(
      onTap: func,
      child: Container(
          width: 353,
          height: 44,
          decoration: BoxDecoration(
            color: Color(0xFF0560FD),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xFF0560FD),
            ),
          ),
          child: Center(
            child: Text(buttonName,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                )),
          )));
}

///============ Build Custom Dropdown
class BuildCustomDropdown extends StatefulWidget {
  int index;
  final String hintText;
  late Function(String?) onItemSelected;

  BuildCustomDropdown({
    required this.hintText,
    required this.index,
    void Function(String?)? onItemSelected, // Make onItemSelected nullable
  }) {
    this.onItemSelected = onItemSelected ?? (String? value) {};
  }

  @override
  _BuildCustomDropdownState createState() => _BuildCustomDropdownState();
}

class _BuildCustomDropdownState extends State<BuildCustomDropdown> {
  bool obscureText = true;

  String? valueChoose;
  List<String> listItem = ["Scollaire", "Personnelle"];
  List<String> listItem2 = [
    "En progres  ",
    "A faire",
    "Terminé",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 44,
      child: TextField(
        obscureText: false,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: valueChoose ?? widget.hintText,
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintStyle: const TextStyle(color: Color(0xFF969696)),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;
                  final RenderBox field =
                      context.findRenderObject() as RenderBox;
                  final Offset offset =
                      field.localToGlobal(Offset.zero, ancestor: overlay);

                  final screenWidth = MediaQuery.of(context).size.width;

                  showMenu(
                    context: context,
                    position: widget.index == 1
                        ? RelativeRect.fromLTRB(
                            screenWidth - field.size.width + 125,
                            offset.dy + field.size.height,
                            screenWidth - 16,
                            offset.dy +
                                field.size.height +
                                listItem.length * 40,
                          )
                        : RelativeRect.fromLTRB(
                            screenWidth - field.size.width - 140,
                            offset.dy + field.size.height,
                            screenWidth + 16,
                            offset.dy +
                                field.size.height +
                                listItem.length * 80,
                          ),
                    items: widget.index == 1
                        ? listItem.map((String valueItem) {
                            return PopupMenuItem<String>(
                              value: valueItem,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    valueChoose = valueItem;
                                    widget.onItemSelected(valueItem);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  valueItem,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                        : listItem2.map((String valueItem) {
                            return PopupMenuItem<String>(
                              value: valueItem,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    valueChoose = valueItem;
                                    widget.onItemSelected(valueItem);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  valueItem,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color(0xFFC9C8C8),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    'assets/images/Polygon 1.png',
                    height: 24,
                    width: 24,
                    color: Color(0xFF0560FD),
                  ),
                ),
              ),
            ],
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        readOnly: true,
      ),
    );
  }
}

///============= Build Recharech TextField
class BuildRecharechTextField extends StatefulWidget {
  final String hintText;

  const BuildRecharechTextField({
    required this.hintText,
  });

  @override
  BuildRecharechTextFieldState createState() => BuildRecharechTextFieldState();
}

class BuildRecharechTextFieldState extends State<BuildRecharechTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 44,
      child: TextField(
        obscureText: false,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF6F6F6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintStyle: const TextStyle(color: Color(0xFF969696)),
          contentPadding:
              EdgeInsets.only(top: 15, left: 5, right: 10, bottom: 5),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              'assets/images/Frame 2.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        autocorrect: false,
      ),
    );
  }
}

///============== Build Container
class BuildContainer extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BuildContainer({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<BuildContainer> createState() => _BuildContainerState();
}

class _BuildContainerState extends State<BuildContainer> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.isSelected ? 102 : 80,
        height: 36,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.isSelected ? Color(0xFF0560FD) : Colors.white,
          border: Border.all(
              color: widget.isSelected ? Color(0xFF0560FD) : Color(0xFFD4D4D4)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: "Poppins",
            fontWeight: FontWeight.normal,
            color: widget.isSelected ? Colors.white : Color(0xFF9A9A9A),
          ),
        ),
      ),
    );
  }
}

///============= BuildCard
class BuildCard extends StatefulWidget {
  final String type;
  final String titre;
  final String etat;
  final String dateDebut;
  final String dateFin;
  final double avancement;

  const BuildCard({
    required this.titre,
    required this.type,
    required this.etat,
    required this.dateDebut,
    required this.dateFin,
    required this.avancement,
  });

  @override
  State<BuildCard> createState() => BuildCardState();
}

class BuildCardState extends State<BuildCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 150,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFD4D4D4)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(widget.type,
                        defaultColor: Color(0xFF0560FD),
                        fontSize: 12,
                        margin: EdgeInsets.only(left: 0)),
                    SizedBox(
                      height: 5,
                    ),
                    reusableText(widget.titre,
                        fontSize: 16, margin: EdgeInsets.only(left: 0)),
                  ],
                ),
                SizedBox(
                  width: 80,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/More Circle.png',
                      height: 16,
                      width: 16,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            reusableText(widget.etat,
                defaultColor: Color(0xFF6E6E6E),
                fontSize: 12,
                margin: EdgeInsets.only(left: 0, bottom: 1)),
            customProgressBar(widget.avancement),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/calendar_clock.png',
                  height: 16,
                  width: 16,
                  color: Color(0xFF0560FD),
                ),
                SizedBox(
                  width: 5,
                ),
                reusableText(widget.dateDebut,
                    defaultColor: Color(0xFF6E6E6E),
                    fontSize: 12,
                    margin: EdgeInsets.only(left: 0, bottom: 1)),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/emoji_flags.png',
                  height: 16,
                  width: 16,
                  color: Color(0xFF0560FD),
                ),
                SizedBox(
                  width: 5,
                ),
                reusableText(widget.dateFin,
                    defaultColor: Color(0xFF6E6E6E),
                    fontSize: 12,
                    margin: EdgeInsets.only(left: 0, bottom: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///============= BuildCard custom Progress Bar
Widget customProgressBar(double percentage) {
  return SizedBox(
    height: 24,
    width: 180,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Color(0xFFD9D9D9),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0560FD)),
          ),
        ),
        SizedBox(width: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Text(
            '${percentage.round()}%',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
