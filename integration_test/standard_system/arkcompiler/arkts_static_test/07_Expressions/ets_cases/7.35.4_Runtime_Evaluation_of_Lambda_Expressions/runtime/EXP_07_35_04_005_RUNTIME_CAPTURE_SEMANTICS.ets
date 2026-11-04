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
 * @id EXP_07_35_04_005_RUNTIME_CAPTURE_SEMANTICS
 * @expect runtime
 * @section 7.35.4
 * @design 楠岃瘉鎹曡幏鍙橀噺涓嶆槸鎷疯礉锛氫慨鏀规崟鑾峰彉閲忓弽鏄犲埌鍘熷鍙橀噺锛堝搴?spec 绀轰緥 1-2锛?
 * @note 杩愯鏃剁敤渚嬶細鎹曡幏鍙橀噺鏄紩鐢ㄨ涔夎€岄潪鎷疯礉璇箟
 */
function main(): void {
  // Spec example 1: captured variable is not a copy
  let y: int = 1
  let x1 = (): int => { return y + 1 }
  let r1: int = x1()
  if (r1 != 2) {
    throw new Error('assertion failed 1: expected 2, got ' + r1)
  }

  // Spec example 2: modify captured variable, original changes
  let z: int = 1
  let x2 = (): void => { z++ }
  if (z != 1) {
    throw new Error('assertion failed 2a: expected 1 before capture, got ' + z)
  }
  x2()
  if (z != 2) {
    throw new Error('assertion failed 2b: expected 2 after capture, got ' + z)
  }

  // 鎵╁睍楠岃瘉锛氫慨鏀瑰師濮嬪彉閲忥紝鎹曡幏 lambda 杩斿洖鍊间篃鍙樺寲
  let v: int = 5
  let reader: () => int = (): int => { return v }

  if (reader() != 5) {
    throw new Error('assertion failed 3a: expected 5, got ' + reader())
  }
  v = 10
  if (reader() != 10) {
    throw new Error('assertion failed 3b: expected 10 after var change, got ' + reader())
  }
  v = 100
  if (reader() != 100) {
    throw new Error('assertion failed 3c: expected 100 after var change, got ' + reader())
  }
console.log('verified')
}
