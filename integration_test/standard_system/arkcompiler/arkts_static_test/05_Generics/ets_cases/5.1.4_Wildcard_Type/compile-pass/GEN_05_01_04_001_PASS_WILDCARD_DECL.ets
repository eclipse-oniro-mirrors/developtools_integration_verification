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
 * @id GEN_05_01_04_001_PASS_WILDCARD_DECL
 * @expect compile-pass
 * @section 5.1.4
 * @design instanceof浜х敓閫氶厤绗︾被鍨嬬殑姝ｅ悜楠岃瘉
 * @note 鏇夸唬鍘烳yContainer<Object>鐢ㄤ緥锛屾敼涓洪€氶厤绗﹀疄闄呭満鏅?
 */
class X001<T> {
  public p: T;
  constructor(v: T) { this.p = v }
}
function wildcardDeclTest(): void {
  let obj: Object = new X001<string>('hello')
  if (obj instanceof X001) {
    let w: Any = obj
    console.log('wildcard')
  }
}