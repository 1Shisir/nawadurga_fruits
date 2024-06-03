import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudHelperFunctions {
  ///helper function to check the state of a single database record
  ///returns a widget based on the state of the snapshot
  ///If data is still loading,shows a circular progress indicator
  ///If no data is found , it returns a generic no data found message
  ///If error occurs shows a error message
  ///otherwise returns null
  static Widget? checkSinglerecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No data Found'),
      );
    }

    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }

    return null;
  }

  ///helper function to check the state of a multiple(list) database record
  ///
  ///returns a widget based on the state of the snapshot
  ///If data is still loading,shows a circular progress indicator
  ///If no data is found , it returns a generic no data found message or custom widget if provided
  ///If error occurs shows a error message
  ///otherwise returns null
  static Widget? checkMultiplerecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) {
        return loader;
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) {
        return nothingFound;
      }
      return const Center(
        child: Text('No data Found'),
      );
    }

    if (snapshot.hasError) {
      if (error != null) {
        return error;
      }
      return const Center(
        child: Text('Something went wrong'),
      );
    }

    return null;
  }

  ///create a reference eith an initial file path and name and retrieve the download url
  static Future<String> getUrlFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) {
        return '';
      }
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
