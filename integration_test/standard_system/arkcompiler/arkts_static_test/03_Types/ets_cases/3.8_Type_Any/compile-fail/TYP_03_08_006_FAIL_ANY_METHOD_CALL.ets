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
 * @id TYP_03_08_006_FAIL_ANY_METHOD_CALL
 * @expect compile-fail
 * @section 3.8
 * @design Any 没有方法（spec §3.8 "Type Any has no methods or fields"）
 * @note 反向用例：Any 上调用方法
 */
function testAnyMethodCallFail(): void {
  let a: Any = "hello"
  let len: int = a.length
  let s: string = a.toString()
  let h: int = a.hashCode()
}