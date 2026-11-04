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
 * @id TYP_03_01_020_FAIL_ANY_ACCESS_METHOD
 * @expect compile-fail
 * @section 3.1
 * @design Any 类型无方法无字段，调用方法/访问字段应编译失败: length/toString/hashCode/push/substring
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testAnyInvalidAccessFail(): void {
  let a: Any = "hello"
  let len: int = a.length

  let n: Any = 42
  n.toString()

  let obj: Any = new Object()
  obj.hashCode()

  let arr: Any = [1, 2, 3]
  arr.push(4)

  let s: Any = "test"
  let sub: string = s.substring(1)
}