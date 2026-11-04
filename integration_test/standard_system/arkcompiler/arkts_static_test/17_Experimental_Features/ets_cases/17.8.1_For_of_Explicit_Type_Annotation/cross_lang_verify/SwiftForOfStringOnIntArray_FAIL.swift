/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * Swift equivalent of ArkTS for-of with explicit type annotation (§17.8.1)
 * Case: String explicit type on [Int] -- should FAIL to compile
 *
 * Swift error: Cannot convert value of type 'Int' to expected element type 'String'
 */
// This would cause compile error:
// let arr: [Int] = [1, 2, 3]
// for s: String in arr {  // ERROR: Cannot convert value of type 'Int' to expected element type 'String'
//     print(s)
// }
