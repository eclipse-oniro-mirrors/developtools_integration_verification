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
 * @id EXP_07_28_03_015_RUNTIME_SPEC_EXAMPLES
 * @expect runtime
 * @section 7.28.3
 * @design 验证 spec 中所有 Extended Equality with null or undefined 示例的运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function assert(cond: boolean, msg: string): void {
  if (!cond) {
    throw new Error('FAIL: ' + msg);
  }
  }
  }
  }
  }
}

function foo(x: Object | null, y: Object | null | undefined): void {
  // spec: console.log(x == y, x === y)
  let eq: boolean = x == y;
  let seq: boolean = x === y;
  // 当 x=null, y=undefined 时: eq=true, seq=false
  // 当 x=null, y=null 时: eq=true, seq=true
  if (y == undefined && x == null) {
    assert(eq == true, 'x == y should be true when x=null, y=undefined');
    assert(seq == false, 'x === y should be false when x=null, y=undefined');
  }
}

function main(): void {
  // ===== spec 示例 1: 可空参数比较 =====
  // foo(null, undefined) // output: true, false
  let x1: Object | null = null;
  let y1: Object | null | undefined = undefined;
  assert(x1 == y1, "null == undefined should be true (spec example 1)");
  assert((x1 === y1) == false, "null === undefined should be false (spec example 1)");

  // foo(null, null) // output: true, true
  let x2: Object | null = null;
  let y2: Object | null | undefined = null;
  assert(x2 == y2, "null == null should be true (spec example 2)");
  assert(x2 === y2, "null === null should be true (spec example 2)");

  // ===== spec 示例 2: 直接比较 =====
  // console.log(null == undefined) // output: true
  assert(null == undefined, "null == undefined should be true (spec)");

  // console.log(null === undefined) // output: false
  assert((null === undefined) == false, "null === undefined should be false (spec)");

  console.log('verified');
}
