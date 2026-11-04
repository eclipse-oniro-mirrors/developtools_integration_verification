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
 * @id EXP2_17_16_001_PASS_INSTANCEOF_STRING
 * @expect compile-pass
 * @section 17.16
 * @design 使用 instanceof 进行类型测试——Object 变量检查是否为 String 类型
 * @note 正向用例：验证 instanceof 用于基本类型测试编译通过。ArkTS 不支持 is 运算符，须使用 instanceof。
 */
function testInstanceofString(): void {
  let obj: Object = 'hello'
  let isStr: boolean = obj instanceof String
  console.log('instanceof result: ' + isStr)
}
