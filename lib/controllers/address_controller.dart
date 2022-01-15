import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/models/address.dart';

class AddressController extends GetxController {
  final _supabaseClient = Supabase.instance.client;
  List<Address> addressList = [];
  int selectedIndex = 0;
  bool hasFetched = false;

  @override
  void onInit() {
    getDefaultShippingAddress();
    super.onInit();
  }

  Future fetchAddresses() async {
    //get address list
    final response = await _supabaseClient
        .from("Addresses")
        .select()
        .eq(
          "user_id",
          _supabaseClient.auth.user()?.id,
        )
        .execute();
    final responseList = response.data as List;
    for (int i = 0; i < responseList.length; i++) {
      addressList.add(Address.fromJson(responseList[i]));
    }
    update();
  }

  Future getDefaultShippingAddress() async {
    //get default shipping address
    final defaultShippingResponse = await _supabaseClient
        .from("Users")
        .select('default_shipping_id')
        .eq(
          "Uid",
          _supabaseClient.auth.user()?.id,
        )
        .execute();
    int? responseId = defaultShippingResponse.data[0]['default_shipping_id'];
    await fetchAddresses();
    if (responseId != null) {
      for (int i = 0; i < addressList.length; i++) {
        if (addressList.elementAt(i).id == responseId) {
          selectedIndex = i;
          update();
          break;
        }
      }
    }
    hasFetched = true;
  }

  Future setDefaultShippingAddress(int index) async {
    await _supabaseClient
        .from("Users")
        .update({'default_shipping_id': addressList.elementAt(index).id})
        .eq(
          "Uid",
          _supabaseClient.auth.user()?.id,
        )
        .execute();
    update();
    selectedIndex = index;
  }

  Future uploadAddress(String name, String address, int pincode, String country,
      String city, String district) async {
    final insertData = await _supabaseClient.from("Addresses").insert({
      'full_name': name,
      'address': address,
      'pincode': pincode,
      'country': country,
      'city': city,
      'district': district,
      'user_id': _supabaseClient.auth.user()?.id,
    }).execute();
    if (addressList.isEmpty) {
      selectedIndex = 0;
      //set default user Address Id in the database
      await _supabaseClient
          .from("Users")
          .update({'default_shipping_id': insertData.data['id']})
          .eq(
            "Uid",
            _supabaseClient.auth.user()?.id,
          )
          .execute();
    }
    //add to shipping address list
    addressList.add(
      Address(
        id: insertData.data[0]['id'],
        name: name,
        address: address,
        pincode: pincode,
        country: country,
        city: city,
        district: district,
      ),
    );
    update();
    Get.back();
  }

  Future editAddress(int index, Address newAddress) async {
    //update values in the database
    await _supabaseClient
        .from("Addresses")
        .update(newAddress.toJson())
        .eq("id", newAddress.id)
        .execute();
    //update the value locally
    addressList[index] = newAddress;
    update();
    Get.back();
  }

  Future deleteAddress(int index) async {
    //check if it is the selected index
    if (index == selectedIndex) {
      if (addressList.length == 1) {
        Get.snackbar(
            "Error", "Add a different address before removing this one");
        return;
      } else {
        selectedIndex = 0;
        setDefaultShippingAddress((index == 0) ? 1 : 0);
      }
    }
    //remove address from the database
    await _supabaseClient
        .from("Addresses")
        .delete(returning: ReturningOption.minimal)
        .eq("id", addressList.elementAt(index).id)
        .execute();
    //remove from local list
    addressList.removeAt(index);
    //go back to previous page
    update();
    Get.back();
  }
}
