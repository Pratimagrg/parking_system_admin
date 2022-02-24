import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final onTap;
  final dynamic category;
  const CategoryTile({Key? key, this.onTap, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x60000000),
            offset: Offset(0, 6),
            blurRadius: 6,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category['category'],
                style: const TextStyle(fontSize: 22, color: Color(0xff154C79)),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Total slots: ' + category['slots'],
                style: const TextStyle(fontSize: 15, color: Color(0xff154C79)),
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
                height: 40,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff154C79),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
