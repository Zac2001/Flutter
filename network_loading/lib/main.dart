import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_loading/cubit/network_loading_cubit.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
    providers: [
      
      BlocProvider<NetworkLoadingCubit>(
        lazy: true,
        create: (_) {
          return NetworkLoadingCubit();
        },
      )
    ],
    child:  MaterialApp(
      home: MyNetworkLoading(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class MyNetworkLoading extends StatelessWidget {
  const MyNetworkLoading({super.key});

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: AppBar(
            title: const Text("Network Loading"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NetworkLoadingCubit>(context).loading();
                      }, child: const Text("loading")),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NetworkLoadingCubit>(context).success();
                      }, child: const Text("success")),
                  ElevatedButton(onPressed: () {
                    BlocProvider.of<NetworkLoadingCubit>(context).error();
                  }, child: const Text("fail"))
                ],
              ),
              Expanded(
                child:  BlocBuilder<NetworkLoadingCubit, NetworkLoadingState>(
            builder: (context, state) {
              if (state is NetworkSuccess) {
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (_, position) {
                    return Center(child: Text(state.data[position]));
                  },
                );
              } else if (state is NetworkFail) {
                return Center(child: Text(state.shwoMessage)); // Assume 'showMessage' typo fix
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    ),
  );
}
}
