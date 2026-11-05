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
 * @id EXP2_17_03_011_FAIL_VALUEARRAY_STRING
 * @expect compile-fail
 * @section 17.3
 * @design Valuestring[] 编译错误：string 不是值类型，ValueArray 的类型参数必须是值类型（byte/short/int/long/float/double/char/boolean）
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testValueArrayStringFail(): void {
  let a: Valuestring[] = ['hello', 'world']
  console.log(a[0])
}
