import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUtil {
  static const String baseUrl = String.fromEnvironment('BASE_URL_SUPABASE');
  static const String anonKey = String.fromEnvironment('ANON_KEY_SUPABASE');

  static SupabaseClient get supabaseInstance => Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: baseUrl,
      anonKey: anonKey,
    );
  }
}
