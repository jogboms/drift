---
title: "Builder options"
description: >-
  Advanced options applied when writing the generated code
---

The `moor_generator` package has some options that control how the 
code is generated. Note that, in most cases, the default settings
should be sufficient.

To use the options, create a `build.yaml` file in the root of your project (e.g. next
to your `pubspec.yaml`):
```yaml
# build.yaml. This file is quite powerful, see https://pub.dev/packages/build_config

targets:
  $default:
    builders:
      moor_generator:
        options:
          write_from_json_string_constructor: true
```

At the moment, moor supports these options:

* `write_from_json_string_constructor`: boolean. Adds a `.fromJsonString` factory
   constructor to generated data classes. By default, we only write a `.fromJson`
   constructor that takes a `Map<String, dynamic>`.
* `override_hash_and_equals_in_result_sets`: boolean. When moor generates another class
   to hold the result of generated select queries, this flag controls whether moor should
   override `operator ==` and `hashCode` in those classes.