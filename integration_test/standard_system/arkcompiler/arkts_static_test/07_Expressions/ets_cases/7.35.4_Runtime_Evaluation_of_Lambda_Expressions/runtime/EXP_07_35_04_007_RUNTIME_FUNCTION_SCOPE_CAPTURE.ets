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
 * @id EXP_07_35_04_007_RUNTIME_FUNCTION_SCOPE_CAPTURE
 * @expect runtime
 * @section 7.35.4
 * @design 楠岃瘉鍑芥暟浣滅敤鍩熸崟鑾凤細姣忔璋冪敤 capturingFunction 浜х敓鐙珛鎹曡幏鍙橀噺锛堝搴?spec 绀轰緥 3锛?
 * @note 杩愯鏃剁敤渚嬶細func1 鍜?func2 鏄笉鍚岀殑鍑芥暟绫诲瀷瀹炰緥锛屽悇鏈夎嚜宸辩殑 'v' 鎹曡幏鍙橀噺
 */

// capturingFunction 杩斿洖涓€涓嚱鏁帮紝璇ュ嚱鏁拌缃唴閮ㄦ崟鑾风殑鍙橀噺 v
// 骞惰繑鍥?v 涔嬪墠鐨勫€?
function capturingFunction(): (p: int) => int {
  let v: int = 0
  return (p: int): int => {
    let prev: int = v
    v = p
    return prev // 杩斿洖淇敼鍓嶇殑鍊?
  }
}

function main(): void {
  const func1 = capturingFunction()
  const func2 = capturingFunction()

  // func1 绗竴娆¤皟鐢? prev=0
  let r1: int = func1(11)
  if (r1 != 0) {
    throw new Error('assertion failed 1: func1(11) expected 0, got ' + r1)
  }

  // func2 绗竴娆¤皟鐢? prev=0 (鐙珛鐨?v)
  let r2: int = func2(22)
  if (r2 != 0) {
    throw new Error('assertion failed 2: func2(22) expected 0, got ' + r2)
  }

  // func1 绗簩娆¤皟鐢? prev=11 (func1 鑷繁鐨?v=11)
  let r3: int = func1(33)
  if (r3 != 11) {
    throw new Error('assertion failed 3: func1(33) expected 11, got ' + r3)
  }

  // func2 绗簩娆¤皟鐢? prev=22 (func2 鑷繁鐨?v=22)
  let r4: int = func2(44)
  if (r4 != 22) {
    throw new Error('assertion failed 4: func2(44) expected 22, got ' + r4)
  }

  // 杩涗竴姝ラ獙璇?func1 鍜?func2 鐨勭嫭绔嬫€?
  let r5: int = func1(55)
  if (r5 != 33) {
    throw new Error('assertion failed 5: func1(55) expected 33, got ' + r5)
  }

  let r6: int = func2(66)
  if (r6 != 44) {
    throw new Error('assertion failed 6: func2(66) expected 44, got ' + r6)
  }
console.log('verified')
}
