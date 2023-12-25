import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/data/model/showVendor_model.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/pages/home/home/bookDetailesScreen.dart';
import 'package:taoel_driver_app/view/widgets/statusBar.dart';
import '../../../../core/helpers/helper_fun.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdditionsScreen extends StatefulWidget {
  const AdditionsScreen({super.key, required this.index});

  final int index;

  @override
  State<AdditionsScreen> createState() => _AdditionsScreenState();
}

List checked = [];
bool isChecked = false;

class _AdditionsScreenState extends State<AdditionsScreen> {
  List checked = [false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    int price =int.parse( cubit.showVendorModel!.data!.categories![0].products![widget.index].price.toString());
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is AdditionsSuccess){
            navigateTo(context, BookDetailsScreen(
              itemName: cubit.showVendorModel!.data!.categories![0]
                  .products![widget.index].name
                  .toString(),
              price: cubit.showVendorModel!.data!.categories![0]
                  .products![widget.index].price
                  .toString(),
              quantity: cubit.counter.toString(),

            ));
          }
          if(state is AdditionError){
            HelperFunctions.showFlashBar(
                context: context,
                title: 'خطأ',
                message: state.error,
                color: Color(0xffF6A9A9),
                titlcolor: Color(0xffD62E2E),
                icon: Icons.warning_amber,
                iconColor: Color(0xffD62E2E)
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:size.width*0.05 ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const StatusBar(),
                    SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: cubit.showVendorModel!.data!.categories![0]
                                .products![widget.index].media!.isEmpty
                            ? Icon(
                                Icons.image_not_supported_rounded,
                                size: 60.sp,
                              )
                            : Image.network(cubit.showVendorModel!.data!
                                .categories![0].products![widget.index].media![0].path
                                .toString())),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cubit.showVendorModel!.data!.categories![0]
                              .products![widget.index].name
                              .toString(),
                          style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          cubit.showVendorModel!.data!.categories![0]
                              .products![widget.index].description
                              .toString(),
                          style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EG${cubit.showVendorModel!.data!.categories![0].products![widget.index].price}",
                          style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      cubit.incrementCounter();
                                    },
                                    child: const Icon(Icons.add)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    cubit.counter.toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      cubit.decrementCounter();
                                    },
                                    child: const Icon(Icons.remove))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Text(local!.additionalServices,
                          style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    ///----------List --------
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: cubit.showVendorModel!.data!.categories![0].products![0].addition!.length,
                        itemBuilder: (BuildContext context, int index) {
                          // List checked = cubit.showVendorModel!.data!.categories![index].products![index].addition!.toList();
                          final List<String?>? title =
                          cubit.showVendorModel!.data!.categories![0].products![0].addition?.map((e) => e.name).cast<
                              String?>().toList();
                          final List<String?> price = cubit.showVendorModel!.data!.categories![0].products![0].addition!
                              .map((e) =>
                          "${e.price} EG")
                              .toList();
                          return Directionality(
                                textDirection: TextDirection.ltr,
                                child: CheckboxListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: size.width * 0.02),
                                  activeColor:
                                      Theme.of(context).colorScheme.primaryContainer,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  // Circle Checkbox
                                  value: checked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      checked[index] = value;
                                    });
                                    checked[index];
                                    checked[index] ? cubit.addAddition(context,
                                      cubit.showVendorModel!.data!.categories![0].products![0].addition![index], cubit.counter.toString()
                                    ):false;
                                        // : cubit
                                        // .removeAddition(context, widget.features![index]);
                                  },
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text(price[index].toString(),
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                              )),
                                          // Text("ssssssssss",
                                          //     style: TextStyle(
                                          //       fontSize: 16.sp,
                                          //     )),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        title![index].toString(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                        },
                      ),
                    ),
                    Container(
                        width: size.width,
                        height: 51.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),

                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                            ),
                            onPressed: () {
                              cubit.addAdditionToCart(context, cubit.showVendorModel!.data!.categories![0].products![0].id.toString(), cubit.counter.toString(),);
                              // cubit.showOrderCart('1', '0', 'notes', 'cod',price*cubit.counter);
                              },
                            child:state is AdditionsLoading?const Center(child:  CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            )): Text(local.addToCard,style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp
                            ),))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
