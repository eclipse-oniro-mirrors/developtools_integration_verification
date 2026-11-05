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
 * @id EXP_07_35_01_013_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.35.1
 * @design 杩愯鏃堕獙璇佸悇绉?Lambda 绛惧悕褰㈠紡鐨勫垱寤哄拰璋冪敤璇箟姝ｇ‘鎬э細绫诲瀷鎺ㄦ柇鍙傛暟/鏄惧紡绫诲瀷鍙傛暟/澶氬弬鏁?鏃犲弬/杩斿洖绫诲瀷娉ㄨВ
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 Lambda 绛惧悕鍦ㄨ繍琛屾椂琛屼负姝ｇ‘锛屽寘鎷被鍨嬫帹鏂€佸鍙傛暟銆佹樉寮忕被鍨嬨€佽繑鍥炵被鍨嬫敞瑙ｇ瓑鍦烘櫙
 */
function main(): void {
  // 1. 绫诲瀷鎺ㄦ柇鍙傛暟 Lambda 璋冪敤鍊兼纭?
  const f1: (p: int) => int = x => x
  let r1: int = f1(42)
  if (r1 != 42) { throw new Error('FAIL: inferred param: ' + r1) }

  // 2. 鏄惧紡绫诲瀷鍙傛暟 Lambda 璋冪敤鍊兼纭?
  const f2: (x: int) => int = (x: int) => x * 2
  let r2: int = f2(5)
  if (r2 != 10) { throw new Error('FAIL: typed param: ' + r2) }

  // 3. 澶氬弬鏁?Lambda
  const f3: (a: int, b: int) => int = (x: int, y: int) => x + y
  let r3: int = f3(3, 4)
  if (r3 != 7) { throw new Error('FAIL: multi param: ' + r3) }

  // 4. 澶氬弬鏁颁粠涓婁笅鏂囨帹鏂?
  const f4: (a: int, b: int) => int = (x, y) => x + y
  let r4: int = f4(10, 20)
  if (r4 != 30) { throw new Error('FAIL: inferred multi: ' + r4) }

  // 5. 鏃犲弬鏁?Lambda
  const f5: () => int = () => 99
  let r5: int = f5()
  if (r5 != 99) { throw new Error('FAIL: no params: ' + r5) }

  // 6. 甯﹁繑鍥炵被鍨嬫敞瑙?
  const f6: (x: int) => int = (x: int): int => x * x
  let r6: int = f6(6)
  if (r6 != 36) { throw new Error('FAIL: return type: ' + r6) }

  // 7. 娣峰悎绫诲瀷澶氬弬鏁?
  const f7: (s: string, n: int) => string = (s: string, n: int) => s + n
  let r7: string = f7('n=', 77)
  if (r7 != 'n=77') { throw new Error('FAIL: mixed types: ' + r7) }
console.log('verified')
}
