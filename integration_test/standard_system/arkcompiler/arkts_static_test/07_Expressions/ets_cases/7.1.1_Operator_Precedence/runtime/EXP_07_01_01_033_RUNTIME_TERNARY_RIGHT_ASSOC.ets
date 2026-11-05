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
 * @id EXP_07_01_01_033_RUNTIME_TERNARY_RIGHT_ASSOC
 * @expect runtime
 * @section 7.1.1
 * @design 三元条件右结合：`a ? b : c ? d : e` 等价 `a ? b : (c ? d : e)`
 * @note 运行时用例：验证三元右结合性
 */
function main(): void {
  let r1: int = false ? 10 : true ? 20 : 30
  // 右结合: false ? 10 : (true ? 20 : 30) -> false分支 -> true ? 20 : 30 = 20
  if (r1 != 20) {
    throw new Error('assertion failed: false?10:true?20:30 != 20, got ' + r1)
  }
  let r2: int = true ? 1 : false ? 2 : 3
  // 右结合: true ? 1 : (false ? 2 : 3) -> true分支 -> 1
  if (r2 != 1) {
    throw new Error('assertion failed: true?1:false?2:3 != 1, got ' + r2)
  }
  let r3: int = false ? 100 : false ? 200 : 300
  // 右结合: false ? 100 : (false ? 200 : 300) -> false分支 -> false ? 200 : 300 = 300
  if (r3 != 300) {
    throw new Error('assertion failed: false?100:false?200:300 != 300, got ' + r3)
  }
console.log('verified')
}
