// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/data_bloc.dart';

class TopPart extends StatefulWidget {
  const TopPart({
    Key? key,
  }) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  void _showSort() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sort By',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                height: 50,
                width: 150,
                child: OutlinedButton(
                    onPressed: () => context.read<DataBloc>().sortDate(true),
                    child: const Text('Most Recent')),
              ),
              SizedBox(
                  height: 50,
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () => context.read<DataBloc>().sortDate(false),
                      child: const Text('Oldest'))),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        autofocus: true,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.zero,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.3),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'Search',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.7),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: IconButton(
              icon: const Icon(Icons.tune), onPressed: () => _showSort()),
        ),
        onChanged: (value) => context.read<DataBloc>().searchData(value),
      ),
    );
  }
}
