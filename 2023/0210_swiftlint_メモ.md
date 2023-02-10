wip

swiftlint rules の内容を確認してみる

<img width="1440" alt="スクリーンショット 2023-02-10 8 43 05" src="https://user-images.githubusercontent.com/16571394/217963868-7be8c7c6-38e2-4d2a-ac25-7778bf7044c8.png">

- identifier: ruleの識別子
- opt-in: 明示的にルールを許諾する必要がある
  - true: ルールをyml側に明示しないと現れない
  - false: ルールをymlに書かなくても、 `enabled in your config==true` の場合、設定が適用される
- correctable:
- enabled in your config: 設定で有効になっているかどうか
  - true: yml上でtrueとして設定している or あらかじめルールとして有効になるようにswiftlintプログラム内で制御されているパターン
  - false: yml上でfalseとして設定している or あらかじめルールとして無効になるようにswiftlintプログラム内で制御されているパターン（例えばopt-in=yesのものの場合、デフォルトではopt-inが設定されていることはないので、この値はfalseになっている）
- kind: ruleがどういった種類のものかをカテゴリ分けしているっぽい。下記の種類
  - style
  - lint
  - idiomatic
  - metrics
  - performance
- analyzer:
- uses sourcekit: 
- configuration:

```
$ swiftlint --version
0.50.3

$ swiftlint rules
+------------------------------------------+--------+-------------+------------------------+-------------+----------+----------------+-------------------------------------------+
| identifier                               | opt-in | correctable | enabled in your config | kind        | analyzer | uses sourcekit | configuration                             |
+------------------------------------------+--------+-------------+------------------------+-------------+----------+----------------+-------------------------------------------+
| accessibility_label_for_image            | yes    | no          | no                     | lint        | no       | yes            | warning                                   |
| accessibility_trait_for_button           | yes    | no          | no                     | lint        | no       | yes            | warning                                   |
| anonymous_argument_in_multiline_closure  | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| anyobject_protocol                       | yes    | yes         | no                     | lint        | no       | no             | warning                                   |
| array_init                               | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| attributes                               | yes    | no          | no                     | style       | no       | no             | warning, always_on_same_line: ["@IBAct... |
| balanced_xctest_lifecycle                | yes    | no          | no                     | lint        | no       | no             | warning, test_parent_classes: ["QuickS... |
| block_based_kvo                          | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| capture_variable                         | yes    | no          | no                     | lint        | yes      | yes            | warning                                   |
| class_delegate_protocol                  | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| closing_brace                            | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| closure_body_length                      | yes    | no          | no                     | metrics     | no       | no             | warning: 30, error: 100                   |
| closure_end_indentation                  | yes    | yes         | no                     | style       | no       | yes            | warning                                   |
| closure_parameter_position               | no     | no          | yes                    | style       | no       | no             | warning                                   |
| closure_spacing                          | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| collection_alignment                     | yes    | no          | no                     | style       | no       | no             | warning, align_colons: false              |
| colon                                    | no     | yes         | yes                    | style       | no       | no             | warning, flexible_right_spacing: false... |
| comma                                    | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| comma_inheritance                        | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| comment_spacing                          | no     | yes         | yes                    | lint        | no       | no             | warning                                   |
| compiler_protocol_init                   | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| computed_accessors_order                 | no     | no          | yes                    | style       | no       | no             | warning, order: get_set                   |
| conditional_returns_on_newline           | yes    | no          | no                     | style       | no       | no             | warning, if_only: false                   |
| contains_over_filter_count               | yes    | no          | no                     | performance | no       | no             | warning                                   |
| contains_over_filter_is_empty            | yes    | no          | no                     | performance | no       | no             | warning                                   |
| contains_over_first_not_nil              | yes    | no          | no                     | performance | no       | no             | warning                                   |
| contains_over_range_nil_comparison       | yes    | no          | no                     | performance | no       | no             | warning                                   |
| control_statement                        | no     | yes         | yes                    | style       | no       | yes            | warning                                   |
| convenience_type                         | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| custom_rules                             | no     | no          | no                     | style       | no       | yes            | user-defined                              |
| cyclomatic_complexity                    | no     | no          | yes                    | metrics     | no       | yes            | warning: 10, error: 20, ignores_case_s... |
| deployment_target                        | no     | no          | yes                    | lint        | no       | no             | warning, iOSApplicationExtension_deplo... |
| discarded_notification_center_observer   | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| discouraged_assert                       | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| discouraged_direct_init                  | no     | no          | yes                    | lint        | no       | no             | warning, types: ["Bundle", "Bundle.ini... |
| discouraged_none_name                    | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| discouraged_object_literal               | yes    | no          | no                     | idiomatic   | no       | no             | warning, image_literal: true, color_li... |
| discouraged_optional_boolean             | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| discouraged_optional_collection          | yes    | no          | no                     | idiomatic   | no       | yes            | warning                                   |
| duplicate_enum_cases                     | no     | no          | yes                    | lint        | no       | no             | error                                     |
| duplicate_imports                        | no     | yes         | yes                    | idiomatic   | no       | yes            | warning                                   |
| duplicated_key_in_dictionary_literal     | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| dynamic_inline                           | no     | no          | yes                    | lint        | no       | no             | error                                     |
| empty_collection_literal                 | yes    | no          | no                     | performance | no       | no             | warning                                   |
| empty_count                              | yes    | no          | no                     | performance | no       | no             | error, only_after_dot: false              |
| empty_enum_arguments                     | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| empty_parameters                         | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| empty_parentheses_with_trailing_closure  | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| empty_string                             | yes    | no          | no                     | performance | no       | no             | warning                                   |
| empty_xctest_method                      | yes    | no          | no                     | lint        | no       | no             | warning, test_parent_classes: ["QuickS... |
| enum_case_associated_values_count        | yes    | no          | no                     | metrics     | no       | no             | warning: 5, error: 6                      |
| expiring_todo                            | yes    | no          | no                     | lint        | no       | yes            | approaching_expiry_severity: warning, ... |
| explicit_acl                             | yes    | no          | no                     | idiomatic   | no       | yes            | warning                                   |
| explicit_enum_raw_value                  | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| explicit_init                            | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| explicit_self                            | yes    | yes         | no                     | style       | yes      | yes            | warning                                   |
| explicit_top_level_acl                   | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| explicit_type_interface                  | yes    | no          | no                     | idiomatic   | no       | yes            | warning, excluded: [], allow_redundanc... |
| extension_access_modifier                | yes    | no          | no                     | idiomatic   | no       | yes            | warning                                   |
| fallthrough                              | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| fatal_error_message                      | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| file_header                              | yes    | no          | no                     | style       | no       | yes            | warning, required_string: None, requir... |
| file_length                              | no     | no          | yes                    | metrics     | no       | yes            | warning: 400, error: 1000, ignore_comm... |
| file_name                                | yes    | no          | no                     | idiomatic   | no       | no             | (severity) warning, excluded: ["LinuxM... |
| file_name_no_space                       | yes    | no          | no                     | idiomatic   | no       | no             | (severity) warning, excluded: []          |
| file_types_order                         | yes    | no          | no                     | style       | no       | yes            | warning, order: [[SwiftLintFramework.F... |
| first_where                              | yes    | no          | no                     | performance | no       | no             | warning                                   |
| flatmap_over_map_reduce                  | yes    | no          | no                     | performance | no       | no             | warning                                   |
| for_where                                | no     | no          | yes                    | idiomatic   | no       | no             | warning, allow_for_as_filter: false       |
| force_cast                               | no     | no          | yes                    | idiomatic   | no       | no             | error                                     |
| force_try                                | no     | no          | yes                    | idiomatic   | no       | no             | error                                     |
| force_unwrapping                         | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| function_body_length                     | no     | no          | yes                    | metrics     | no       | no             | warning: 50, error: 100                   |
| function_default_parameter_at_end        | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| function_parameter_count                 | no     | no          | yes                    | metrics     | no       | no             | warning: 5, error: 8ignores_default_pa... |
| generic_type_name                        | no     | no          | yes                    | idiomatic   | no       | no             | (min_length) w/e: 1/0, (max_length) w/... |
| ibinspectable_in_extension               | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| identical_operands                       | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| identifier_name                          | no     | no          | yes                    | style       | no       | yes            | (min_length) w/e: 3/2, (max_length) w/... |
| implicit_getter                          | no     | no          | yes                    | style       | no       | no             | warning                                   |
| implicit_return                          | yes    | yes         | no                     | style       | no       | yes            | warning, included: [closure, function,... |
| implicitly_unwrapped_optional            | yes    | no          | no                     | idiomatic   | no       | no             | warning, mode: allExceptIBOutlets         |
| inclusive_language                       | no     | no          | yes                    | style       | no       | no             | warning, additional_terms: [], overrid... |
| indentation_width                        | yes    | no          | no                     | style       | no       | yes            | severity: warning, indentation_width: ... |
| inert_defer                              | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| is_disjoint                              | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| joined_default_parameter                 | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| large_tuple                              | no     | no          | yes                    | metrics     | no       | no             | warning: 2, error: 3                      |
| last_where                               | yes    | no          | no                     | performance | no       | no             | warning                                   |
| leading_whitespace                       | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| legacy_cggeometry_functions              | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| legacy_constant                          | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| legacy_constructor                       | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| legacy_hashing                           | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| legacy_multiple                          | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| legacy_nsgeometry_functions              | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| legacy_objc_type                         | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| legacy_random                            | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| let_var_whitespace                       | yes    | no          | no                     | style       | no       | yes            | warning                                   |
| line_length                              | no     | no          | yes                    | metrics     | no       | yes            | warning: 120, error: 200, ignores urls... |
| literal_expression_end_indentation       | yes    | yes         | no                     | style       | no       | yes            | warning                                   |
| local_doc_comment                        | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| lower_acl_than_parent                    | yes    | yes         | no                     | lint        | no       | no             | warning                                   |
| mark                                     | no     | yes         | yes                    | lint        | no       | yes            | warning                                   |
| missing_docs                             | yes    | no          | no                     | lint        | no       | yes            | warning: open, public, excludes_extens... |
| modifier_order                           | yes    | yes         | no                     | style       | no       | yes            | warning, preferred_modifier_order: [ov... |
| multiline_arguments                      | yes    | no          | no                     | style       | no       | yes            | warning, first_argument_location: any_... |
| multiline_arguments_brackets             | yes    | no          | no                     | style       | no       | no             | warning                                   |
| multiline_function_chains                | yes    | no          | no                     | style       | no       | yes            | warning                                   |
| multiline_literal_brackets               | yes    | no          | no                     | style       | no       | yes            | warning                                   |
| multiline_parameters                     | yes    | no          | no                     | style       | no       | no             | warning, allowsSingleLine: true           |
| multiline_parameters_brackets            | yes    | no          | no                     | style       | no       | yes            | warning                                   |
| multiple_closures_with_trailing_closure  | no     | no          | yes                    | style       | no       | no             | warning                                   |
| nesting                                  | no     | no          | yes                    | metrics     | no       | yes            | (type_level) w: 1, (function_level) w:... |
| nimble_operator                          | yes    | yes         | no                     | idiomatic   | no       | yes            | warning                                   |
| no_extension_access_modifier             | yes    | no          | no                     | idiomatic   | no       | no             | error                                     |
| no_fallthrough_only                      | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| no_grouping_extension                    | yes    | no          | no                     | idiomatic   | no       | yes            | warning                                   |
| no_magic_numbers                         | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| no_space_in_method_call                  | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| notification_center_detachment           | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| ns_number_init_as_function_reference     | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| nslocalizedstring_key                    | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| nslocalizedstring_require_bundle         | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| nsobject_prefer_isequal                  | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| number_separator                         | yes    | yes         | no                     | style       | no       | no             | warning, minimum_length: 0, minimum_fr... |
| object_literal                           | yes    | no          | no                     | idiomatic   | no       | no             | warning, image_literal: true, color_li... |
| opening_brace                            | no     | yes         | yes                    | style       | no       | yes            | warning, allowMultilineFunc: false        |
| operator_usage_whitespace                | yes    | yes         | no                     | style       | no       | no             | warning, lines_look_around: 2, skip_al... |
| operator_whitespace                      | no     | no          | yes                    | style       | no       | no             | warning                                   |
| optional_enum_case_matching              | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| orphaned_doc_comment                     | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| overridden_super_call                    | yes    | no          | no                     | lint        | no       | no             | warning, excluded: [], included: ["*"]... |
| override_in_extension                    | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| pattern_matching_keywords                | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| prefer_nimble                            | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| prefer_self_in_static_references         | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| prefer_self_type_over_type_of_self       | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| prefer_zero_over_explicit_init           | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| prefixed_toplevel_constant               | yes    | no          | no                     | style       | no       | no             | warning, only_private: false              |
| private_action                           | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| private_outlet                           | yes    | no          | no                     | lint        | no       | no             | warning, allow_private_set: false         |
| private_over_fileprivate                 | no     | yes         | yes                    | idiomatic   | no       | no             | warning, validate_extensions: false       |
| private_subject                          | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| private_unit_test                        | no     | yes         | yes                    | lint        | no       | no             | warning: XCTestCase                       |
| prohibited_interface_builder             | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| prohibited_super_call                    | yes    | no          | no                     | lint        | no       | no             | warning, excluded: [[]], included: [["... |
| protocol_property_accessors_order        | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| quick_discouraged_call                   | yes    | no          | no                     | lint        | no       | yes            | warning                                   |
| quick_discouraged_focused_test           | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| quick_discouraged_pending_test           | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| raw_value_for_camel_cased_codable_enum   | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| reduce_boolean                           | no     | no          | yes                    | performance | no       | no             | warning                                   |
| reduce_into                              | yes    | no          | no                     | performance | no       | no             | warning                                   |
| redundant_discardable_let                | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| redundant_nil_coalescing                 | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| redundant_objc_attribute                 | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| redundant_optional_initialization        | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| redundant_set_access_control             | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| redundant_string_enum_value              | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| redundant_type_annotation                | yes    | yes         | no                     | idiomatic   | no       | yes            | warning                                   |
| redundant_void_return                    | no     | yes         | yes                    | idiomatic   | no       | yes            | warning                                   |
| required_deinit                          | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| required_enum_case                       | yes    | no          | no                     | lint        | no       | no             | No protocols configured.  In config ad... |
| return_arrow_whitespace                  | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| return_value_from_void_function          | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| self_binding                             | yes    | yes         | no                     | style       | no       | no             | warning, bindIdentifier: self             |
| self_in_property_initialization          | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| shorthand_operator                       | no     | no          | yes                    | style       | no       | no             | error                                     |
| shorthand_optional_binding               | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| single_test_class                        | yes    | no          | no                     | style       | no       | no             | warning, test_parent_classes: ["QuickS... |
| sorted_first_last                        | yes    | no          | no                     | performance | no       | no             | warning                                   |
| sorted_imports                           | yes    | yes         | no                     | style       | no       | yes            | warning                                   |
| statement_position                       | no     | yes         | yes                    | style       | no       | yes            | (statement_mode) default, (severity) w... |
| static_operator                          | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| strict_fileprivate                       | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| strong_iboutlet                          | yes    | yes         | no                     | lint        | no       | no             | warning                                   |
| superfluous_disable_command              | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| switch_case_alignment                    | no     | no          | yes                    | style       | no       | no             | warning, indented_cases: false            |
| switch_case_on_newline                   | yes    | no          | no                     | style       | no       | no             | warning                                   |
| syntactic_sugar                          | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| test_case_accessibility                  | yes    | yes         | no                     | lint        | no       | no             | warning, allowed_prefixes: [], test_pa... |
| todo                                     | no     | no          | yes                    | lint        | no       | yes            | warning                                   |
| toggle_bool                              | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| trailing_closure                         | yes    | no          | no                     | style       | no       | yes            | warning, only_single_muted_parameter: ... |
| trailing_comma                           | no     | yes         | yes                    | style       | no       | no             | warning, mandatory_comma: false           |
| trailing_newline                         | no     | yes         | yes                    | style       | no       | no             | warning                                   |
| trailing_semicolon                       | no     | yes         | yes                    | idiomatic   | no       | no             | warning                                   |
| trailing_whitespace                      | no     | yes         | yes                    | style       | no       | yes            | warning, ignores_empty_lines: false, i... |
| type_body_length                         | no     | no          | yes                    | metrics     | no       | no             | warning: 250, error: 350                  |
| type_contents_order                      | yes    | no          | no                     | style       | no       | yes            | warning, order: [[SwiftLintFramework.T... |
| type_name                                | no     | no          | yes                    | idiomatic   | no       | no             | (min_length) w/e: 3/0, (max_length) w/... |
| typesafe_array_init                      | yes    | no          | no                     | lint        | yes      | yes            | warning                                   |
| unavailable_condition                    | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| unavailable_function                     | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| unneeded_break_in_switch                 | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| unneeded_parentheses_in_closure_argument | yes    | yes         | no                     | style       | no       | no             | warning                                   |
| unowned_variable_capture                 | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| untyped_error_in_catch                   | yes    | yes         | no                     | idiomatic   | no       | no             | warning                                   |
| unused_capture_list                      | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| unused_closure_parameter                 | no     | yes         | yes                    | lint        | no       | no             | warning                                   |
| unused_control_flow_label                | no     | yes         | yes                    | lint        | no       | no             | warning                                   |
| unused_declaration                       | yes    | no          | no                     | lint        | yes      | yes            | severity: error, include_public_and_op... |
| unused_enumerated                        | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| unused_import                            | yes    | yes         | no                     | lint        | yes      | yes            | severity: warning, require_explicit_im... |
| unused_optional_binding                  | no     | no          | yes                    | style       | no       | no             | warning, ignore_optional_try: false       |
| unused_setter_value                      | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| valid_ibinspectable                      | no     | no          | yes                    | lint        | no       | no             | warning                                   |
| vertical_parameter_alignment             | no     | no          | yes                    | style       | no       | no             | warning                                   |
| vertical_parameter_alignment_on_call     | yes    | no          | no                     | style       | no       | yes            | warning                                   |
| vertical_whitespace                      | no     | yes         | yes                    | style       | no       | yes            | warning, max_empty_lines: 1               |
| vertical_whitespace_between_cases        | yes    | yes         | no                     | style       | no       | yes            | warning                                   |
| vertical_whitespace_closing_braces       | yes    | yes         | no                     | style       | no       | yes            | warning, only_enforce_before_trivial_l... |
| vertical_whitespace_opening_braces       | yes    | yes         | no                     | style       | no       | yes            | warning                                   |
| void_function_in_ternary                 | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| void_return                              | no     | yes         | yes                    | style       | no       | yes            | warning                                   |
| weak_delegate                            | yes    | no          | no                     | lint        | no       | no             | warning                                   |
| xct_specific_matcher                     | yes    | no          | no                     | idiomatic   | no       | no             | warning                                   |
| xctfail_message                          | no     | no          | yes                    | idiomatic   | no       | no             | warning                                   |
| yoda_condition                           | yes    | no          | no                     | lint        | no       | no             | warning                                   |
+------------------------------------------+--------+-------------+------------------------+-------------+----------+----------------+-------------------------------------------+

```
