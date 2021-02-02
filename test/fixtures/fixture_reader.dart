import 'dart:io';

String fixture(String name) => File('/Users/tobiasoho/Git/syld_app/test/fixtures/$name').readAsStringSync();
