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
 * @id TYP_03_01_007_PASS_OBJECT_ACCEPT_SUBTYPES
 * @expect compile-pass
 * @section 3.1
 * @design Object 类型接受字符串/数值/布尔/类实例，Object[] 数组
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class MyClass007 {
  value: int = 0
}

function acceptObject(p: Object): void {}

function testObjectBasic(): void {
  let o: Object = new Object()
  o = "hello"
  o = 42
  o = true
  o = 3.14
  o = new MyClass007()

  let arr: Object[] = [new Object(), "str", 1]
}

function callAcceptObject(): void {
  acceptObject(new Object())
  acceptObject("str")
  acceptObject(42)
}