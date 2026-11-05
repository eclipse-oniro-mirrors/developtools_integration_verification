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
 * @id EXP_07_35_03_012_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.35.3
 * @design 楠岃瘉 Lambda 琛ㄨ揪寮忕被鍨嬪湪杩愯鏃惰涔夌殑姝ｇ‘鎬э細鏄惧紡绫诲瀷銆佹帹鏂被鍨嬨€佸弬鏁颁紶閫掔瓑
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉 lambda 璋冪敤杩斿洖鍊肩殑姝ｇ‘鎬?
 */

// 楂橀樁鍑芥暟绫诲瀷鍒悕
type IntBinaryOp = (x: int, y: int) => int

function applyOp(a: int, b: int, op: IntBinaryOp): int {
  return op(a, b)
}

function makeAdder(base: int): (x: int) => int {
  return (x: int): int => x + base
}

function main(): void {
  // 1. 鏄惧紡杩斿洖绫诲瀷 lambda
  const f1: () => int = (): int => 42
  let r1: int = f1()
  if (r1 != 42) {
    throw new Error('assertion failed: expected 42, got ' + r1)
  }

  // 2. 鎺ㄦ柇杩斿洖绫诲瀷锛堣〃杈惧紡浣擄級
  const f2: (x: int) => int = (x: int) => x * 2
  let r2: int = f2(21)
  if (r2 != 42) {
    throw new Error('assertion failed: expected 42, got ' + r2)
  }

  // 3. 鎺ㄦ柇杩斿洖绫诲瀷锛堝潡浣擄級
  const f3: () => int = () => { return 123 }
  let r3: int = f3()
  if (r3 != 123) {
    throw new Error('assertion failed: expected 123, got ' + r3)
  }

  // 4. 涓婁笅鏂囨帹鏂弬鏁扮被鍨?
  const f4: (x: string) => int = x => x.length
  let r4: int = f4('hello')
  if (r4 != 5) {
    throw new Error('assertion failed: expected 5, got ' + r4)
  }

  // 5. 鏃犲弬 lambda
  const f5: () => string = (): string => 'world'
  let r5: string = f5()
  if (r5 != 'world') {
    throw new Error('assertion failed: expected 'world', got ' + r5)
  }

  // 6. Lambda 浣滀负鍙傛暟浼犻€掞紙楂橀樁鍑芥暟锛?
  let sum: int = applyOp(10, 32, (x: int, y: int): int => x + y)
  if (sum != 42) {
    throw new Error('assertion failed: expected 42, got ' + sum)
  }

  // 7. Lambda 浣滀负杩斿洖绫诲瀷
  let add5: (x: int) => int = makeAdder(5)
  let r7: int = add5(37)
  if (r7 != 42) {
    throw new Error('assertion failed: expected 42, got ' + r7)
  }

  // 8. 澶氬弬鏁?lambda
  const f8: (x: int, y: int) => int = (x: int, y: int): int => x - y
  let r8: int = f8(50, 8)
  if (r8 != 42) {
    throw new Error('assertion failed: expected 42, got ' + r8)
  }

  // 9. 鏃犲弬 lambda 鍧椾綋
  const f9: () => boolean = () => { return true }
  let r9: boolean = f9()
  if (r9 != true) {
    throw new Error('assertion failed: expected true, got ' + r9)
  }
console.log('verified')
}
