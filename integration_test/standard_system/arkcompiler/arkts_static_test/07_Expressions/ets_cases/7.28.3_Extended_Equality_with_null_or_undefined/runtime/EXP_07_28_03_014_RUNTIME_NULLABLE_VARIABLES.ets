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
 * @id EXP_07_28_03_014_RUNTIME_NULLABLE_VARIABLES
 * @expect runtime
 * @section 7.28.3
 * @design 验证可空类型变量赋值 null/undefined 后的等值比较运行时行为
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

function main(): void {
  // ===== 变量赋值 null =====
  let a: Object | null = null;

  assert(a == null, 'null variable == null should be true');
  assert(a === null, 'null variable === null should be true');
  assert(a == undefined, "null variable == undefined should be true (extended)");
  assert((a === undefined) == false, 'null variable === undefined should be false');

  // ===== 变量赋值 undefined =====
  let b: Object | undefined = undefined;

  assert(b == undefined, 'undefined variable == undefined should be true');
  assert(b === undefined, 'undefined variable === undefined should be true');
  assert(b == null, "undefined variable == null should be true (extended)");
  assert((b === null) == false, 'undefined variable === null should be false');

  // ===== null 变量 vs undefined 变量 =====
  assert(a == b, "null variable == undefined variable should be true (extended)");
  assert((a === b) == false, 'null variable === undefined variable should be false');

  console.log('verified');
}
