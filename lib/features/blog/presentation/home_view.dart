import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_blog/core/widgets/widgets.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/bloc/blog_bloc_event.dart';
import 'package:flutter_bloc_blog/features/blog/presentation/cubit/locale_cubit.dart';
import 'package:flutter_bloc_blog/localization/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogBloc>().add(FetchPinnedBlogsEvent());
  }

  void _switchLanguage(String languageCode) {
    context.read<LocaleCubit>().switchLocale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive dimensions for the text field container
    final containerWidth = screenWidth * 0.8;
    final containerHeight = screenHeight * 0.06;
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return Localizations.override(
          context: context,
          locale: locale,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('hey'),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.language),
                        onPressed: () => _switchLanguage('hi'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context).translate('whats_on_your_mind'), style: const TextStyle(fontSize: 22, color: Colors.grey)),
                ),
                const SizedBox(height: 60),
                buildSearchRow(containerWidth, containerHeight),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      Text(AppLocalizations.of(context).translate('pinned_notes'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 20),
                buildPinnedNotesList(screenWidth, screenHeight),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      Text(AppLocalizations.of(context).translate('recent_notes'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 20),
                buildRecentNotesList(screenWidth, screenHeight)
              ],
            ),
          ),
        );
      },
    );
  }
}
