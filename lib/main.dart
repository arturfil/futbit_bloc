import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futbit_bloc/cubits/group_list/group_list_cubit.dart';
import 'package:futbit_bloc/presentation/pages/home_page.dart';
import 'package:futbit_bloc/repositories/GroupRepository.dart';
import 'package:futbit_bloc/services/group_api_service.dart';
import 'package:http/http.dart' as http;
import './presentation/router.dart' as router;

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const FutBit());
}

class FutBit extends StatelessWidget {
  const FutBit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GroupRepository(
          groupApiService: GroupApiService(
        httpClient: http.Client(),
      )),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GroupListCubit>(
            create: (context) => GroupListCubit(
              groupRepository: context.read<GroupRepository>(),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "FutBit",
          onGenerateRoute: router.generateRoute,
          home: HomePage(),
        ),
      ),
    );
  }
}
