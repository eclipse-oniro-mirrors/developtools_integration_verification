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
 * @id TYP_03_20_013_FAIL_DIRECT_MEMBER_ACCESS
 * @expect compile-fail
 * @section 3.20
 * @design nullish 类型不能直接访问成员，必须使用 ?. 或转换
 * @note 反向用例：直接 obj.field / obj.method()
 */
class Person13 {
  name: string = ""
  greet(): string { return "hi" }
}

function testDirectMemberAccessFail(): void {
  let p: Person13 | undefined = undefined
  let n: string = p.name
  let g: string = p.greet()
}