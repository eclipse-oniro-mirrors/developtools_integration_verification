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
 * @id CON_06_01_042_RUNTIME_ALL_CONTEXTS_INTEGRATION
 * @expect runtime
 * @section 6.1
 * @design 鎵€鏈夎祴鍊肩被涓婁笅鏂囬泦鎴愯繍琛屾椂琛屼负锛氬０鏄庛€佽祴鍊笺€佽皟鐢ㄣ€佽繑鍥炪€佸鍚堝瓧闈㈤噺鑱斿悎楠岃瘉
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц缁煎悎楠岃瘉鍚勮祴鍊间笂涓嬫枃鐨勫崗鍚岃涓?
 */
class Accumulator {
  public total: int = 0

  constructor(initial: int) {
    this.total = initial
  }

  add(value: int): int {
    let temp: int = this.total + value
    this.total = temp
    return temp
  }
}

function buildMessage(prefix: string, value: int): string {
  return prefix + value
}

function main(): void {
  let acc: Accumulator = new Accumulator(10)
  if (acc.total != 10) {
    throw new Error('assertion failed: constructor init expected 10')
  }

  let afterAdd: int = acc.add(5)
  if (afterAdd != 15) {
    throw new Error('assertion failed: add(5) result expected 15, got ' + afterAdd)
  }
  if (acc.total != 15) {
    throw new Error('assertion failed: field updated expected 15')
  }

  let msg: string = buildMessage("value:", acc.total)
  if (msg != 'value:15') {
    throw new Error('assertion failed: message expected 'value:15', got ' + msg)
  }

  let info: string[] = ["ok", "pass", msg]
  if (info.length != 3) {
    throw new Error('assertion failed: array length expected 3')
  }
  if (info[2] != 'value:15') {
    throw new Error('assertion failed: composite literal element mismatch')
  }

  console.log('All assignment-like contexts integration verified')
}