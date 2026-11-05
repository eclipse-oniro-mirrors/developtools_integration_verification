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
 * @id TYP_03_03_020_FAIL_KEYOF_INVALID_VALUE
 * @expect compile-fail
 * @section 3.3
 * @design keyof T 生成 union of 字段名字面量，赋值非字段名应失败
 * @note 反向用例：keyof C 不接受不存在的属性名
 */
class C20 {
  name: string = ""
  age: int = 0
}

function testKeyofInvalidFail(): void {
  let k: keyof C20 = "nonExistentField"
  let k2: keyof C20 = "wrong"
}