import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/bloc/get_all_details/get_all_details_bloc.dart';
import 'package:task/src/model/get_all_details_model.dart';
import 'package:task/src/utils/common_widgets/shimmer_widget.dart';
import 'package:task/src/utils/style/app_colors.dart';
import 'package:task/src/utils/style/widget_utils.dart';

class GetAllDetailsScreen extends StatefulWidget {
  GetAllDetailsScreen({Key? key}) : super(key: key);

  @override
  State<GetAllDetailsScreen> createState() => _GetAllDetailsScreenState();
}

class _GetAllDetailsScreenState extends State<GetAllDetailsScreen> {
  late GetALlDetailsBloc _getALlDetailsBloc;
  bool isOverallOnboardShimmerLoad = true;
  GetAllDetailsModel? getAllDetailsModel;

  @override
  void initState() {
    _getALlDetailsBloc = BlocProvider.of<GetALlDetailsBloc>(context);
    _getALlDetailsBloc.stream.listen(getALlDetailBlocListener);
    _getALlDetailsBloc.add(GetALlDetailsDataEvent(type: 'Car'));
    super.initState();
  }

  Future<void> getALlDetailBlocListener(state) async {
    if (mounted) {
      if (state is GetALlDetailsDataSucessState) {
        setState(() {
          isOverallOnboardShimmerLoad = false;
          getAllDetailsModel = state.getAllDetailsModel;
        });
      } else if (state is GetALlDetailsDataFailedState) {
        setState(() {
          isOverallOnboardShimmerLoad = false;
        });
      } else if (state is GetALlDetailsDataFailedState) {
        setState(() {
          isOverallOnboardShimmerLoad = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightSecondaryBlue.withOpacity(0.69),
        title: const Text(
          "Car Master",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: isOverallOnboardShimmerLoad ? _getBodyShimmer() : _getBody(),
    );
  }

  Widget _getBody() {
    if (getAllDetailsModel == null || getAllDetailsModel!.data == null) {
      return const Center(
        child: Text('No data found'),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _getButtonWidget(
              color: AppColors.lightSecondaryBlue.withOpacity(0.5),
              header: 'Add More',
            ),
            horizontalSpaceSmall,
          ],
        ),
        verticalSpaceMedium,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: getAllDetailsModel!.data!.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.white,
              ),
              itemBuilder: (context, index) {
                final getData = getAllDetailsModel!.data![index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightSecondaryBlue.withOpacity(0.69),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rowWidget(
                          header: 'Id',
                          title: getData.id.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Location Label',
                          title: getData.locationLabel.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'location Name',
                          title: getData.locationName.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Longitude',
                          title: getData.longitude.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Latitude',
                          title: getData.latitude.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Created By',
                          title: getData.createdBy.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Created At',
                          title: getData.createdAt.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Updated By',
                          title: getData.updatedBy.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Updated At',
                          title: getData.updatedAt.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Is Active',
                          title: getData.isActive.toString(),
                        ),
                        verticalSpaceTiny,
                        _rowWidget(
                          header: 'Remark',
                          title: getData.remark.toString(),
                        ),
                        verticalSpaceTiny,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBodyShimmer() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: AppColors.light1Purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 8),
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: ListTile(
                            leading:
                                ShimmerWidget.circular(width: 30, height: 30),
                            title: ShimmerWidget.rectangular(
                                width: 150, height: 19),
                            trailing: ShimmerWidget.rectangular(
                                width: 30, height: 19),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowWidget({String? header, String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header!,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'rubik',
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'rubik',
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getButtonWidget({
    Key? key,
    String? header,
    Color? color,
  }) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        height: MediaQuery.of(context).size.height / 12.4,
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                header!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'rubik',
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
