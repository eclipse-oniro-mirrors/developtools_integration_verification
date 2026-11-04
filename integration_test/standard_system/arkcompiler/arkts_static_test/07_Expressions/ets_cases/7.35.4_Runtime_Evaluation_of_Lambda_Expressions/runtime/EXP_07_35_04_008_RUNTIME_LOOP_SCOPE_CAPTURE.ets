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
 * @id EXP_07_35_04_008_RUNTIME_LOOP_SCOPE_CAPTURE
 * @expect runtime
 * @section 7.35.4
 * @design 楠岃瘉寰幆浣滅敤鍩熸崟鑾凤細姣忔寰幆杩唬鎹曡幏涓嶅悓鐨?index 鍊硷紙瀵瑰簲 spec 绀轰緥 4锛?
 * @note 杩愯鏃剁敤渚嬶細寰幆涓瘡涓?lambda 鎹曡幏鐨?index 鍊间笉鍚?
 */
function main(): void {
  let storage: Array<() => int> = new Array<() => int>()

  // 姣忔寰幆杩唬锛宭et index 鍒涘缓涓€涓柊鐨勭粦瀹?
  for (let index = 0; index < 5; index++) {
    storage.push((): int => { return index })
  }

  // 楠岃瘉姣忎釜 lambda 鎹曡幏浜嗕笉鍚岀殑 index
  let r0: int = storage[0]()
  if (r0 != 0) {
    throw new Error('assertion failed 0: expected 0, got ' + r0)
  }

  let r1: int = storage[1]()
  if (r1 != 1) {
    throw new Error('assertion failed 1: expected 1, got ' + r1)
  }

  let r2: int = storage[2]()
  if (r2 != 2) {
    throw new Error('assertion failed 2: expected 2, got ' + r2)
  }

  let r3: int = storage[3]()
  if (r3 != 3) {
    throw new Error('assertion failed 3: expected 3, got ' + r3)
  }

  let r4: int = storage[4]()
  if (r4 != 4) {
    throw new Error('assertion failed 4: expected 4, got ' + r4)
  }

  // 楠岃瘉閲嶆柊璋冪敤浜х敓鐨勯棴鍖呬篃鎹曡幏鏂扮殑 index
  let storage2: Array<() => int> = new Array<() => int>()
  for (let j = 0;
  }
  }
  }
  } j < 3; j++) {
    storage2.push((): int => { return j })
  }
  if (storage2[0]() != 0) {
    throw new Error('assertion failed 5: expected storage2[0]=0')
  }
  if (storage2[1]() != 1) {
    throw new Error('assertion failed 6: expected storage2[1]=1')
  }
  if (storage2[2]() != 2) {
    throw new Error('assertion failed 7: expected storage2[2]=2')
  }
console.log('verified')
}
