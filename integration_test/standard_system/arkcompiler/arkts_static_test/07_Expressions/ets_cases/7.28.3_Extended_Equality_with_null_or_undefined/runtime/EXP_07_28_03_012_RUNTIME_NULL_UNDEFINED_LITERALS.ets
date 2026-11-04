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
 * @id EXP_07_28_03_012_RUNTIME_NULL_UNDEFINED_LITERALS
 * @expect runtime
 * @section 7.28.3
 * @design 验证 null/undefined 字面量等值比较的运行时行为
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
  // ===== null == undefined (扩展等值核心) =====
  assert(null == undefined, "null == undefined should be true (spec)");

  // ===== null === undefined (严格等值应该区分类型) =====
  assert((null === undefined) == false, "null === undefined should be false (spec)");

  // ===== null != undefined =====
  assert((null != undefined) == false, 'null != undefined should be false');

  // ===== null !== undefined =====
  assert(null !== undefined, 'null !== undefined should be true');

  // ===== null == null =====
  assert(null == null, 'null == null should be true');

  // ===== null === null =====
  assert(null === null, 'null === null should be true');

  // ===== null != null =====
  assert((null != null) == false, 'null != null should be false');

  // ===== null !== null =====
  assert((null !== null) == false, 'null !== null should be false');

  // ===== undefined == undefined =====
  assert(undefined == undefined, 'undefined == undefined should be true');

  // ===== undefined === undefined =====
  assert(undefined === undefined, 'undefined === undefined should be true');

  // ===== undefined != undefined =====
  assert((undefined != undefined) == false, 'undefined != undefined should be false');

  // ===== undefined !== undefined =====
  assert((undefined !== undefined) == false, 'undefined !== undefined should be false');

  console.log('verified');
}
