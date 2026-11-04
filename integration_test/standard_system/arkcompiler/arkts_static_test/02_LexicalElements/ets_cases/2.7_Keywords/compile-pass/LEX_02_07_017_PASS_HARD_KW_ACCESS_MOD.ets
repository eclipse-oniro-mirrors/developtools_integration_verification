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
 * @id LEX_02_07_017_PASS_HARD_KW_ACCESS_MOD
 * @expect compile-pass
 * @section 2.7
 * @design 硬关键字: public, private, protected
 * @note 正向用例：访问修饰符
 */
class Holder017 {
  public pubField: int = 0
  private privField: int = 0
  protected protField: int = 0

  public pubMethod(): int {
    return this.privField + this.protField
  }
}

function test017(): void {
  let h: Holder017 = new Holder017()
  h.pubField = 1
}
