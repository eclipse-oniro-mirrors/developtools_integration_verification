# 03 Types Test Case Catalog

**总用例数：** 728（324P + 195F + 209R）

| Section | compile-pass | compile-fail | runtime | Total |
|---|---:|---:|---:|---:|
| 3.1_Predefined_Types | 18 | 16 | 15 | 49 |
| 3.10_Type_never | 5 | 3 | 2 | 10 |
| 3.11_Type_void_or_undefined | 10 | 5 | 5 | 20 |
| 3.12_Type_null | 12 | 9 | 6 | 27 |
| 3.13_Type_string | 27 | 10 | 15 | 52 |
| 3.14_Type_bigint | 10 | 9 | 8 | 27 |
| 3.15.1_String_Literal_Types | 7 | 3 | 3 | 13 |
| 3.15_Literal_Types | 6 | 4 | 4 | 14 |
| 3.16.1_Resizable_Array_Types | 8 | 1 | 7 | 16 |
| 3.16.2_Readonly_Array_Types | 5 | 4 | 5 | 14 |
| 3.16_Array_Types | 7 | 4 | 5 | 16 |
| 3.17.1_Readonly_Tuple_Types | 2 | 3 | 3 | 8 |
| 3.17.2_Type_Tuple | 10 | 8 | 8 | 26 |
| 3.17_Tuple_Types | 6 | 3 | 5 | 14 |
| 3.18.1_Type_Function | 2 | 1 | 2 | 5 |
| 3.18_Function_Types | 11 | 8 | 10 | 29 |
| 3.19.1_Union_Types_Normalization | 8 | 5 | 4 | 17 |
| 3.19.2_Access_to_Common_Union_Members | 4 | 5 | 2 | 11 |
| 3.19.3_Keyof_Types | 6 | 4 | 2 | 12 |
| 3.19_Union_Types | 6 | 4 | 1 | 11 |
| 3.2_User_Defined_Types | 11 | 11 | 8 | 30 |
| 3.20_Nullish_Types | 10 | 6 | 6 | 22 |
| 3.21.1_Awaited_Utility_Type | 8 | 2 | 2 | 12 |
| 3.21.2_NonNullable_Utility_Type | 5 | 2 | 2 | 9 |
| 3.21.3_Partial_Utility_Type | 4 | 3 | 3 | 10 |
| 3.21.4_Required_Utility_Type | 4 | 3 | 2 | 9 |
| 3.21.5_Readonly_Utility_Type | 4 | 3 | 2 | 9 |
| 3.21.6_Record_Utility_Type | 6 | 2 | 2 | 10 |
| 3.21.7_ReturnType_Utility_Type | 6 | 1 | 2 | 9 |
| 3.21.8_Utility_Type_Private_Fields | 3 | 2 | 2 | 7 |
| 3.21.9_Nesting_Utility_Types | 3 | 2 | 1 | 6 |
| 3.22_Default_Values_for_Types | 2 | 3 | 5 | 10 |
| 3.3_Using_Types | 12 | 10 | 5 | 27 |
| 3.4_Named_Types | 10 | 6 | 4 | 20 |
| 3.5_Type_References | 10 | 5 | 4 | 19 |
| 3.6.1_Numeric_Types | 10 | 5 | 5 | 20 |
| 3.6.2_Integer_Types_and_Operations | 10 | 9 | 10 | 29 |
| 3.6.3_Floating_Point_Types_and_Operations | 10 | 2 | 18 | 30 |
| 3.6.4_Type_boolean | 8 | 2 | 5 | 15 |
| 3.7_Reference_Types | 8 | 2 | 3 | 13 |
| 3.8_Type_Any | 5 | 3 | 3 | 11 |
| 3.9_Type_Object | 5 | 2 | 3 | 10 |
| **Total** | **324** | **195** | **209** | **728** |

## 本次补充覆盖

| Section | 新增用例 | 覆盖点 |
|---|---|---|
| 3.7 Reference Types | TYP_03_07_012, TYP_03_07_013 | 引用类型不可赋值给值类型 |
| 3.21.1 Awaited Utility Type | TYP_03_21_01_009, TYP_03_21_01_010 | Awaited 结果类型负向赋值检查 |
| 3.21.8 Utility Type Private Fields | TYP_03_21_08_005~007 | object literal 公开字段、private 字段拒绝、运行时私有状态保留 |
| 3.22 Default Values for Types | TYP_03_22_006~010 | char 默认值、undefined 超类型默认值、enum/type parameter 无默认值 |
