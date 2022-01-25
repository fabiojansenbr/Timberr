import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/widgets/tabbed/orders_tab_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: kOffBlack,
                size: 20,
              ),
            ),
            centerTitle: true,
            title: Text(
              "MY ORDERS",
              style: kMerriweatherBold,
            ),
            bottom: const OrdersTabBar(index: 0),
            floating: true,
          ),
          // const OrdersTabBar(index: 0),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            for (int i = 0; i < 10; i++)
              Container(
                height: 172,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x408A959E),
                      offset: Offset(0, 8),
                      blurRadius: 40,
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order no 38546",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kOffBlack,
                            ),
                          ),
                          Text(
                            "25/12/2021",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              color: kTinGrey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: kSnowFlakeWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Row(
                        children: [
                          Text(
                            "Quantity: ",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kTinGrey,
                            ),
                          ),
                          Text(
                            "03",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kOffBlack,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Total amount: ",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kTinGrey,
                            ),
                          ),
                          Text(
                            "\$150",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kOffBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: kOffBlack,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Detail",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Delivered",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kCrayolaGreen,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    )
                  ],
                ),
              )
          ]))
        ],
      ),
    );
  }
}
