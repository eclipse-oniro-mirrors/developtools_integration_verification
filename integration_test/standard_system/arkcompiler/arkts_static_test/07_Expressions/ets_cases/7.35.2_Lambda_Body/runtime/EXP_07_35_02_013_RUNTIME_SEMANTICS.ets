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
 * @id EXP_07_35_02_013_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.35.2
 * @design 杩愯鏃堕獙璇佸悇绉?Lambda 浣撳舰寮忕殑鎵ц璇箟锛氬崟琛ㄨ揪寮忎綋銆佸潡浣?+ return銆佸潡浣撳璇彞銆佹崟鑾峰眬閮ㄥ彉閲忋€佹崟鑾峰疄渚嬪瓧娈点€佹棤鍙傚潡浣?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 Lambda 浣撳湪杩愯鏃惰涓烘纭紝鍏?7 涓柇瑷€
 */
class Holder {
  public factor: int = 10

  getLambda(): () => int {
    return (): int => {
      return this.factor
    }
  }
}

function main(): void {
  // 1. 鍗曡〃杈惧紡浣撹繑鍥炲€兼纭?
  const f1: (x: int) => int = (x: int): int => x * 2
  let r1: int = f1(5)
  if (r1 != 10) { throw new Error('FAIL: expression body: ' + r1) }

  // 2. 鍧椾綋 + return 杩斿洖鍊兼纭?
  const f2: (x: int) => int = (x: int): int => {
    return x + 1
  }
  let r2: int = f2(10)
  if (r2 != 11) { throw new Error('FAIL: block body return: ' + r2) }

  // 3. 鍧椾綋澶氭潯璇彞杩斿洖鍊兼纭?
  const f3: (x: int) => int = (x: int): int => {
    let y: int = x * 3
    return y + 2
  }
  let r3: int = f3(5)
  if (r3 != 17) { throw new Error('FAIL: block multi stmt: ' + r3) }

  // 4. 鎹曡幏澶栧洿灞€閮ㄥ彉閲?
  let captured: int = 100
  const f4: (x: int) => int = (x: int): int => x + captured
  let r4: int = f4(50)
  if (r4 != 150) { throw new Error('FAIL: capture local: ' + r4) }

  // 5. 鎹曡幏瀹炰緥瀛楁锛堥殣寮?this锛?
  let h: Holder = new Holder()
  let f5: () => int = h.getLambda()
  let r5: int = f5()
  if (r5 != 10) { throw new Error('FAIL: capture instance: ' + r5) }

  // 6. 鏃犲弬 lambda 鍧椾綋杩斿洖鍊兼纭?
  const f6: () => int = (): int => {
    return 99
  }
  let r6: int = f6()
  if (r6 != 99) { throw new Error('FAIL: no params block: ' + r6) }

  // 7. 鍧椾綋澶氳鍙?鈥?瀛楃涓叉搷浣?
  const f7: (s: string, n: int) => string = (s: string, n: int): string => {
    let tag: string = s + ':'
    return tag + n
  }
  let r7: string = f7('val', 42)
  if (r7 != 'val:42') { throw new Error('FAIL: block string: ' + r7) }
console.log('verified')
}
