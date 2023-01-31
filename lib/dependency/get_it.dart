import 'package:base/domain/sample/bloc/sample_bloc/bloc.dart';
import 'package:base/domain/sample/bloc/sample_bloc/state.dart';
import 'package:base/domain/sample/repository/pref.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt de = GetIt.I;

class De {
  static De? _instance;
  De._internal() {
    _instance = this;
  }

  factory De() => _instance ?? De._internal();

  Future<void> initial() async {
    /// START config ==============================================

    final prefs = await SharedPreferences.getInstance();

    GetIt.I.registerSingletonAsync<SampleRepoSharedPreference>(
      () async => SampleRepoSharedPreference(
        sharedPreferences: prefs,
      ),
    );

    GetIt.I.registerSingletonAsync<SampleBloc>(
      () async => SampleBloc(
        initState: const SampleState().initial(),
      ),
    );

    /// END config ================================================

    /// EXAMPLE:

    // GetIt.I.registerSingletonAsync<DeviceRepo>(
    //   () async => DeviceRepo(
    //     sharedPreferences: prefs,
    //   ),
    // );

    // GetIt.I.registerSingletonAsync<UserRepoHttp>(
    //   () async => UserRepoHttp(
    //     requestUrl: Environment().config!.mainUrl,
    //     isTest: true,
    //   ),
    // );

    // GetIt.I.registerSingleton<UserBloc>(
    //   UserBloc(
    //     initState: const UserState().initial(),
    //   ),
    // );

    // GetIt.I.registerSingleton<DeviceBloc>(
    //   DeviceBloc(
    //     initState: const DeviceState(
    //       status: Status(type: StatusType.idle),
    //       languageCode: 'vi',
    //       activeBionicLogin: false,
    //       activeNotification: true,
    //     ),
    //   ),
    // );
  }
}
