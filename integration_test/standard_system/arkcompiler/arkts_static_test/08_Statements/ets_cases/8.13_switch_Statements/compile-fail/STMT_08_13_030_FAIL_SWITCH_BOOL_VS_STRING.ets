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
 * @id STMT_08_13_030_FAIL_SWITCH_BOOL_VS_STRING
 * @expect compile-fail
 * @section 8.13
 * @design switch boolean 与 string case 不匹配应产生编译错误
 * @note 反向用例：验证该场景应产生编译时错误。
 */
function testSwitchBoolVsStringFail(): void {
  let b: boolean = true
  switch (b) { case "true": { console.log("bad") } default: {} }
}
