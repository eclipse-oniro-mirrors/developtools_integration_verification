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
 * @id ENM_11_04_010_FAIL_GETVALUEOF_WRONG_ARG_TYPE
 * @expect compile-fail
 * @section 11.4
 * @design getValueOf 参数必须为 string
 * @note 反向用例：验证 getValueOf 非 string 参数编译失败
 */
enum MethodArgColor { Red, Green }
function testGetValueOfWrongArgType(): void {
  let c: MethodArgColor = MethodArgColor.getValueOf(1)
}
