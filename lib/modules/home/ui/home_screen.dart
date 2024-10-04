import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/modules/home/cubit/home_cubit.dart';
import 'package:pixabay/modules/preview/ui/preview_screen.dart';
import 'package:pixabay/utils/utils.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {

final scrollController = ScrollController();
int offset = 1;

 ValueNotifier<bool> isloading = ValueNotifier(false);

@override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
   scrollController.dispose(); 
   isloading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Pixabay",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
         
        },
        builder: (context, state) {
          if(state is HomeLoading){
            return loading();

          }

          if (state is HomeLoadError) {
            return error(state.error);
          }
            if (state is HomeLoaded){
              offset +=1;
              return body(context,state);
            }

          return Container();
        },
      ),
    );
  }
  
  Widget body(BuildContext context, HomeLoaded state) {
    
    return ValueListenableBuilder(valueListenable: isloading, builder: (context, value, child) => GridView.builder(
      shrinkWrap: true,
      controller: scrollController,
      padding:const EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: responsiveCount(context), 
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      mainAxisExtent: responsiveWidth(context)
      ),
    itemCount:value?state.images.length+1: state.images.length,
     itemBuilder: (context, index) {

if(index >= state.images.length){
  return SizedBox(
    width: sW(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loading(),
      ],
    ),
  );
}else{

var data = state.images[index];
return GestureDetector(
  onTap: (){
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>PreviewScreen(image: data.image)));
  },
  child: Stack(
    children: [
      ClipRRect(
        borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(8), 
          topRight: Radius.circular(8)
        ),
        child:Image.network(data.image, 
        loadingBuilder: (context, child,ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null)return child;
          return const Center(child: Icon(Icons.image_rounded,color: Colors.black26,));
        },
        fit: BoxFit.cover,
        height: responsiveWidth(context),
        width: sW(context),
        ) ,),
        Positioned(
          bottom: 0,
          left: 0, 
          right: 0,
          child: Container(
            height: 30, 
            // width: sW(context),
            color: Colors.black45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    spaceWidth(10),
               const Icon(Icons.favorite_border,color: Colors.red,size: 20,), 
                spaceWidth(2),
                Text(data.likes,style:const TextStyle(color: Colors.white),)
                  ],
                ), 
  
                Row(
                  children: [
                    spaceWidth(10),
               const Icon(Icons.remove_red_eye_outlined,color: Colors.white60,size: 20,), 
                spaceWidth(2),
                Text(data.views,style:const TextStyle(color: Colors.white),), 
                    spaceWidth(5),
  
                  ],
                )
  
              ],
            ),
          ),
        )
    ],
  ),
);
     }},)
  
  ,);
  }

  void _scrollListener()async {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
    isloading.value = true;
      await BlocProvider.of<HomeCubit>(context).scrollFetch(page: offset.toString()).then((value)=>
      isloading.value = false
      );
    }
  }
}