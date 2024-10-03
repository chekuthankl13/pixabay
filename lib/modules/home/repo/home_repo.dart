import 'package:pixabay/modules/home/models/image_model.dart';
import 'package:pixabay/services/api_service.dart';

class HomeRepo {
 Future fetchImage({required page})async{
    var res = await ApiService().fetchImages(page: page);
    if (res['status'] == "ok") {
      return {"status":"ok","data":ImageList.fromJson(res['data'])};
    } else {
      return {"status":"!ok","message":res['message']};
    }
  }
}