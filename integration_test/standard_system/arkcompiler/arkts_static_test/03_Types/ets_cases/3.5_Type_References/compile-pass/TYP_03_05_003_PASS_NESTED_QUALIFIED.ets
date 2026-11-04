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
 * @id TYP_03_05_003_PASS_NESTED_QUALIFIED
 * @expect compile-pass
 * @section 3.5
 * @design 嵌套 namespace 的 qualified name 引用
 * @note 正向用例：outer.inner.TypeName
 */
namespace outer3 {
  export namespace inner3 {
    export class Deep {
      x: int = 0
    }
  }
}

function testNestedQualified(): void {
  let d: outer3.inner3.Deep = new outer3.inner3.Deep()
}