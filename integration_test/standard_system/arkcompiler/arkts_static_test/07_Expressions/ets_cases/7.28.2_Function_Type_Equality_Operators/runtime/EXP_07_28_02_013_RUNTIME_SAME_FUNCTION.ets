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
 * @id EXP_07_28_02_013_RUNTIME_SAME_FUNCTION
 * @expect runtime
 * @section 7.28.2
 * @design 验证相同函数对象 == 比较运行时返回 true
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

function foo(): void {}
function bar(): void {}
function goo(p: number): void {}

function main(): void {
  // 相同函数对象
  assert(foo == foo, "foo == foo should be true (spec example)");

  // 不同函数对象
  assert((foo == bar) == false, "foo == bar should be false (spec example)");
  assert(foo != bar, 'foo != bar should be true');

  // 不同签名
  assert((foo == goo) == false, "foo == goo should be false (spec example)");
  assert(foo != goo, 'foo != goo should be true');

  // 通过变量引用
  let f: Function = foo;
  assert(f == foo, 'function variable == original should be true');
  assert((f == bar) == false, 'function variable != different should be false');

  console.log('verified');
}
