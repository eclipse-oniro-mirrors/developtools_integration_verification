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
 * @id CON_06_01_040_RUNTIME_METHOD_CALL_CONTEXT
 * @expect runtime
 * @section 6.1
 * @design 鏂规硶璋冪敤涓婁笅鏂囪繍琛屾椂琛屼负锛氭柟娉曞弬鏁版纭紶閫掔粰鏂规硶浣?
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉鏂规硶璋冪敤鍙傛暟璧嬪€艰涔?
 */
class Multiplier {
  public factor: int = 0

  constructor(f: int) {
    this.factor = f
  }

  multiply(val: int): int {
    return val * this.factor
  }

  describe(label: string, count: int): string {
    return label + count
  }
}

function main(): void {
  let m: Multiplier = new Multiplier(5)
  let result: int = m.multiply(6)
  if (result != 30) {
    throw new Error('assertion failed: multiply(6) expected 30, got ' + result)
  }

  let desc: string = m.describe("count:", 10)
  if (desc != 'count:10') {
    throw new Error('assertion failed: describe expected 'count:10', got ' + desc)
  }

  console.log('Method call context verified')
}